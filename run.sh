#!/bin/bash

set -a
. .env"
. .venv/bin/activate"
set +a

.venv/bin/python3 "ddns.py"