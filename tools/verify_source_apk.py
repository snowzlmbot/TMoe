#!/usr/bin/env python3
"""Static acceptance for the source-built production artifact."""
import argparse,hashlib,struct,zipfile,zlib
p=argparse.ArgumentParser();p.add_argument('apk');a=p.parse_args()
forbidden=[b'Lcc/ioctl/tmoe/startup/ModernRuntimeTests;',b'Lcc/ioctl/tmoe/startup/ProfileLiveTest;',b'Lcc/ioctl/tmoe/startup/VerificationRunner;',b'tmoe_selftest_nonce',b'cc.ioctl.tmoe.startup.ModernRuntimeTests',b'cc.ioctl.tmoe.startup.ProfileLiveTest',b'Lcc/ioctl/tmoe/startup/SourceUiTest;',b'Lcc/ioctl/tmoe/startup/VerificationNetworkSink;',b'Lcc/ioctl/tmoe/startup/VerificationVideoFixture;']
required=[b'Lcc/ioctl/tmoe/startup/ModernHookEntry;',b'Lcc/ioctl/tmoe/startup/ModernFeatureHooks;',b'Lcc/ioctl/tmoe/startup/ModernProfileIds;',b'Lcc/ioctl/tmoe/startup/ModernPaidReactionGuard;']
with zipfile.ZipFile(a.apk) as z:
 assert z.read('META-INF/xposed/java_init.list').strip()==b'cc.ioctl.tmoe.startup.ModernHookEntry'
 dex=[]
 for name in z.namelist():
  if not name.endswith('.dex'):continue
  b=z.read(name);assert b[12:32]==hashlib.sha1(b[32:]).digest(),name+' SHA1'
  assert struct.unpack_from('<I',b,8)[0]==zlib.adler32(b[12:]),name+' Adler32'
  dex.append(b)
 joined=b'\n'.join(dex)
 for term in forbidden:assert term not in joined,'Production contains verification code: '+term.decode()
 for term in required:assert term in joined,'Missing app source class: '+term.decode()
 assert any(n.startswith('lib/arm64-v8a/') and n.endswith('libtmoe.so') for n in z.namelist()),'Native library was not built'
print('SOURCE_PRODUCTION_STATIC_PASS; no test classes or nonce entry; modern source entry and native library present')
