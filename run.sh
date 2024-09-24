#!/bin/bash

set -a
. "$dir/.env"
set +a

dir=$(dirname $0)
python3 "$dir/ddns.py"