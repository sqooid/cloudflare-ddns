#!/bin/bash

dir=$(dirname $0)

set -a
. "$dir/.env"
. "$dir/.venv/bin/activate"
set +a

python3 "$dir/ddns.py"