#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZK_LOGIN_MAIN="$SCRIPT_DIR/keys/zkLogin-main.zkey"

# Download the proving key
bash "$SCRIPT_DIR"/keys/download.sh

if [ ! -f "$ZK_LOGIN_MAIN" ]; then
    echo "zkLogin-main.zkey not found"
    exit 1
fi

docker run -dt \
        -e ZKEY=/app/binaries/zkLogin.zkey \
        -e WITNESS_BINARIES=/app/binaries \
        -v "$ZK_LOGIN_MAIN":/app/binaries/zkLogin.zkey \
        -p 1234:8080 \
        --name zklogin-prover \
        mysten/zklogin:prover-stable
