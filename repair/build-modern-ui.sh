#!/bin/sh
set -eu
cd "$(dirname "$0")"
: "${ANDROID_HOME:=/opt/android-sdk}"
SDK_JAR="$ANDROID_HOME/platforms/android-34/android.jar"
D8_JAR="$ANDROID_HOME/build-tools/35.0.0/lib/d8.jar"
: "${APKTOOL_JAR:=tools/apktool.jar}"
mkdir -p modern-stub-classes modern-classes modern-dex
javac -encoding UTF-8 -source 8 -target 8 -cp "$SDK_JAR" -d modern-stub-classes modern-stubs/cc/ioctl/tmoe/base/BaseProxyFragment.java modern-stubs/cc/ioctl/tmoe/util/HostInfo.java
javac -encoding UTF-8 -source 8 -target 8 -cp "$SDK_JAR:modern-stub-classes" -d modern-classes modern-src/cc/ioctl/tmoe/startup/ModernPreferences.java modern-src/cc/ioctl/tmoe/fragment/ModernSettingsFragment.java
jar cf modern-ui.jar -C modern-classes .
java -Xmx768m -cp "$D8_JAR" com.android.tools.r8.D8 --min-api 24 --lib "$SDK_JAR" --classpath modern-stub-classes --output modern-dex modern-ui.jar
python3 -c "import zipfile; z=zipfile.ZipFile('modern-ui.apk','w'); z.write('modern-dex/classes.dex','classes.dex'); z.close()"
java -Xmx768m -jar "$APKTOOL_JAR" d -f -r -o modern-decoded modern-ui.apk
