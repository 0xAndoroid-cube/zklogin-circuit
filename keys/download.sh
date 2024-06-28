#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZK_LOGIN_MAIN="$SCRIPT_DIR/zkLogin-main.zkey"

if [ -f "$ZK_LOGIN_MAIN" ]; then
    echo "zkLogin-main.zkey already exists"
    exit 0
fi

curl -L -o "$ZK_LOGIN_MAIN" "https://github.com/sui-foundation/zklogin-ceremony-contributions/raw/main/zkLogin-main.zkey"
