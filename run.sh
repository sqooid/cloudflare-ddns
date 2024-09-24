#!/bin/bash

set -a
. .env
. .venv/bin/activate
set +a

python3 "ddns.py"