#!/bin/bash
set -e
# Set directory to where we expect code to be
cd /go/src/app
echo "Start script..."
govendor sync
echo "sync ---- OK"
govendor add +external
echo "ADD ----- OK"
#fresh
echo "starting test"
#go test -v ./... -cover
