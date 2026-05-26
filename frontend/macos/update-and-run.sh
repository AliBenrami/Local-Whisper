#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_PATH="$SCRIPT_DIR/build/DrWisper.app"
LOG_PATH="$HOME/Library/Logs/drWisper/drwisper.log"

pkill -f DrWisperMac 2>/dev/null || true
"$SCRIPT_DIR/build-app.sh" >/dev/null
open "$APP_PATH"

BUILD_VERSION="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleVersion' "$APP_PATH/Contents/Info.plist")"

echo "drWisper is running."
echo "Build: $BUILD_VERSION"
echo "App: $APP_PATH"
echo "Log: $LOG_PATH"
