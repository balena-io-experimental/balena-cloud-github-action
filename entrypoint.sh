#!/bin/sh

BALENA_APP_NAME="${INPUT_BALENA_APP_NAME:-}"
BALENA_TOKEN="${INPUT_BALENA_TOKEN:-}"

[ ! -z "$BALENA_APP_NAME" ] || exit 1
[ ! -z "$BALENA_TOKEN" ] || exit 1

export BALENARC_BALENA_URL="${INPUT_BALENA_URL:-balena-cloud.com}"

timeout 10 balena login --token "$BALENA_TOKEN" || exit 2
balena push "$BALENA_APP_NAME" || exit 3
