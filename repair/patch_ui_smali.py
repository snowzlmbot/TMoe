#!/usr/bin/env python3
"""Patch decoded TMoe r241 API102 smali for Telegram web 13.1.0/72299.
Use after `apktool d -r`. Reassemble with apktool: never byte-replace DEX
strings in place, because ga1->t91 changes string_ids ordering.
No user data or credentials are read by this program.
"""
import argparse
import hashlib
import json
import re
from pathlib import Path

UI_REPLACEMENTS = {
    'org.telegram.ui.ga1': 'org.telegram.ui.t91',
    'org.telegram.ui.Components.b71': 'org.telegram.ui.Components.f71',
    'org.telegram.ui.ca1': 'org.telegram.ui.p91',
    'org.telegram.ui.ActionBar.s2': 'org.telegram.ui.ActionBar.r2',
}
NEW_ALIASES = {
    'org.telegram.ui.ActionBar.BaseFragment': 'org.telegram.ui.ActionBar.r2',
    'org.telegram.ui.ActionBar.ActionBar': 'org.telegram.ui.ActionBar.l',
    'org.telegram.ui.ActionBar.Theme': 'org.telegram.ui.ActionBar.n6',
}


def change_ui(source):
    result = source
    changes = {}
    for old, new in UI_REPLACEMENTS.items():
        count = result.count('"' + old + '"')
        if count < 1:
            raise ValueError('Required r241 literal missing: ' + old)
        result = result.replace('"' + old + '"', '"' + new + '"')
        changes[old] = {'replacement': new, 'count': count}
    count = len(re.findall(r'\b0x1189f\b', result, re.I))
    if count:
        result = re.sub(r'\b0x1189f\b', '0x11a6b', result, flags=re.I)
    elif not re.search(r'\b0x11a6b\b', result, re.I):
        raise ValueError('Neither original nor patched host version was found')
    changes['host_version'] = {'old': 71839, 'new': 72299, 'count': count}
    # Prepare module resources before any host settings cell requests its icon.
    # prepareHost uses v2 for the Application and v3 for modulePath. We verify
    # that exact data flow before reusing v3 after setModulePathOverride.
    pattern = r'(\.method[^\n]* prepareHost\([^\n]*\n)(.*?)(\.end method)'
    matches = list(re.finditer(pattern, result, re.S))
    if len(matches) != 1:
        raise ValueError('prepareHost method must occur exactly once')
    m = matches[0]
    body = m.group(2)
    if not re.search(r'invoke-static \{v2\}, Lcc/ioctl/tmoe/util/HostInfo;->setHostApplication', body):
        raise ValueError('prepareHost Application register is not the audited v2')
    needle = 'invoke-static {v3}, Lcc/ioctl/tmoe/lifecycle/Parasitics;->setModulePathOverride(Ljava/lang/String;)V'
    if body.count(needle) != 1:
        raise ValueError('Unexpected prepareHost module path register')
    extra = '''

    # TMoe 72299: make module icons available before host settings bind.
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-static {v3}, Lcc/ioctl/tmoe/lifecycle/Parasitics;->injectModuleResources(Landroid/content/res/Resources;)V'''
    body = body.replace(needle, needle + extra)
    result = result[:m.start(2)] + body + result[m.end(2):]
    changes['prepare_resources'] = 'injected, using audited v2/v3 registers'
    # Telegram 72299 parentLayout is a navigation interface, not ViewGroup.
    # Invoke inherited BaseFragment.presentFragment(BaseFragment) instead of
    # casting the interface to ViewGroup and looking for obsolete overloads.
    template = Path(__file__).with_name('present-settings.smali').read_text()
    nav_pattern = r'\.method private static presentSettings\(Ljava/lang/Object;\)V\n.*?\.end method'
    result, nav_count = re.subn(nav_pattern, lambda _: template.rstrip(), result, flags=re.S)
    if nav_count != 1:
        raise ValueError('Expected exactly one presentSettings method')
    changes['navigation'] = 'inherited BaseFragment.presentFragment(BaseFragment), errors logged'
    result = change_preferences(result, static=True)
    changes['configuration'] = 'SharedPreferences: no legacy Hook singleton initialization'
    return result, changes


def change_preferences(source, static=False):
    prefix = 'private static' if static else 'private'
    parameter = 'p0' if static else 'p1'
    pattern = rf'\.method {prefix} isEnabled\(Ljava/lang/String;\)Z\n.*?\.end method'
    replacement = f'''.method {prefix} isEnabled(Ljava/lang/String;)Z
    .locals 1
    invoke-static {{{parameter}}}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z
    move-result v0
    return v0
.end method'''
    result, count = re.subn(pattern, lambda _: replacement, source, flags=re.S)
    if count != 1:
        raise ValueError('Expected one modern isEnabled method')
    return result


def change_registry(source):
    pattern = r'(\.method[^\n]* aliases\(Ljava/lang/String;ILjava/lang/String;\)Ljava/util/List;\n)(.*?)(\.end method)'
    matches = list(re.finditer(pattern, source, re.S))
    if len(matches) != 1:
        raise ValueError('HostSignatureRegistry.aliases must occur exactly once')
    m = matches[0]
    body = m.group(2)
    register = re.search(r'^\s*\.(registers|locals)\s+(\d+)\s*$', body, re.M)
    if not register:
        raise ValueError('No register declaration in aliases')
    required = 4 if register.group(1) == 'registers' else 1
    if int(register.group(2)) < required:
        raise ValueError('No local v0 register available for alias selection')
    code = '''
    # Preserve the original 71839 branch; add only audited 72299 mappings.
    const v0, 0x11a6b
    if-ne p1, v0, :tmoe_original_aliases
    const-string v0, "org.telegram.messenger.web"
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :tmoe_original_aliases
'''
    for index, (canonical, actual) in enumerate(NEW_ALIASES.items()):
        code += f'''
    const-string v0, "{canonical}"
    invoke-virtual {{v0, p2}}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :tmoe_alias_next_{index}
    const-string v0, "{actual}"
    invoke-static {{v0}}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
    move-result-object v0
    return-object v0
    :tmoe_alias_next_{index}
'''
    code += '\n    :tmoe_original_aliases\n'
    body = body[:register.end()] + code + body[register.end():]
    return source[:m.start(2)] + body + source[m.end(2):]


def locate(root, suffix):
    paths = []
    for directory in sorted(root.glob('smali*')):
        candidate = directory / suffix
        if candidate.is_file():
            paths.append(candidate)
    if len(paths) != 1:
        raise ValueError(f'Expected one {suffix}, found {len(paths)}')
    return paths[0]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--audit', type=Path, required=True)
    args = parser.parse_args()
    ui = locate(args.decoded, 'cc/ioctl/tmoe/startup/ModernUiHooks.smali')
    registry = locate(args.decoded, 'cc/ioctl/tmoe/util/HostSignatureRegistry.smali')
    old_ui, old_registry = ui.read_text(), registry.read_text()
    new_ui, changes = change_ui(old_ui)
    new_registry = change_registry(old_registry)
    entry = locate(args.decoded, 'cc/ioctl/tmoe/startup/ModernHookEntry.smali')
    old_entry = entry.read_text()
    new_entry = change_preferences(old_entry)
    for old, new in {
        'org.telegram.ui.lo': 'org.telegram.ui.ko',
        'org.telegram.ui.iq': 'org.telegram.ui.hq',
        'org.telegram.ui.fk': 'org.telegram.ui.ek',
    }.items():
        if ('"' + old + '"') not in new_entry:
            raise ValueError('Expected modern feature target missing: ' + old)
        new_entry = new_entry.replace('"' + old + '"', '"' + new + '"')
    helpers = Path(__file__).with_name('modern-smali')
    helper_files = sorted(helpers.rglob('*.smali'))
    if not helper_files:
        raise ValueError('Compiled modern API settings helpers are missing')
    # Validate both before writing either.
    record = {
        'target_package': 'org.telegram.messenger.web',
        'target_version_code': 72299,
        'settings_class': 'org.telegram.ui.t91',
        'fill': 'b0(Lorg/telegram/ui/t91;Ljava/util/ArrayList;)V',
        'click': 'f0(Lorg/telegram/ui/t91;Lorg/telegram/ui/Components/f71;)V',
        'ui_changes': changes, 'aliases_72299': NEW_ALIASES,
        'runtime_verified': False,
        'before_sha256': {
            'ui': hashlib.sha256(old_ui.encode()).hexdigest(),
            'registry': hashlib.sha256(old_registry.encode()).hexdigest(),
        },
    }
    ui.write_text(new_ui)
    registry.write_text(new_registry)
    entry.write_text(new_entry)
    destination = ui.parents[4]  # same DEX as ModernUiHooks; no stub classes copied
    for helper in helper_files:
        output = destination / helper.relative_to(helpers)
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(helper.read_text())
    record['modern_helper_classes'] = len(helper_files)
    args.audit.write_text(json.dumps(record, indent=2))
    print(json.dumps(record, indent=2))


if __name__ == '__main__':
    main()
