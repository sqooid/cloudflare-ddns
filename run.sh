#!/bin/bash

set -a
. .env
set +a
. .venv/bin/activate

python3 "ddns.py"