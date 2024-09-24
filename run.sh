#!/bin/bash

dir=$(dirname $0)

set -a
. "$dir/.env"
set +a

python3 "$dir/ddns.py"