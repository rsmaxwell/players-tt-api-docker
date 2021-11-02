#!/bin/bash

export PLAYERS_TT_API_DUMP_DIR="/players-tt-api/dump"

export DEBUG_LEVEL="50"
export DEBUG_DEFAULT_PACKAGE_LEVEL="50"
export DEBUG_DEFAULT_FUNCTION_LEVEL="50"
export DEBUG_PACKAGE_LEVEL_httphandler="50"
export DEBUG_FUNCTION_LEVEL_httphandler_HandlerFunc="40"

set -x
ls -al /players-tt-api/config 1>/players-tt-api/log/listing.txt

/home/fred/bin/players-tt-api --config /players-tt-api/config/config.json 1>/players-tt-api/log/players-tt-api.log 2>/players-tt-api/log/players-tt-api.stderr
