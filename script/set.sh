#!/usr/bin/env ash

set -e
set -u

FUNC_DIR="/func.d"
RUN_DIR="/run.d"

init="$( find "${FUNC_DIR}" -name '*.sh' -type f | sort -u )"
for f in ${init}; do
	. "${f}"
done

init="$( find "${RUN_DIR}" -name '*.sh' -type f | sort -u )"
for f in ${init}; do
	. "${f}"
done

crond -f
