#!/bin/bash

TRAVIOLI_DIR="$(dirname $0)/.."

# Set python runtime
if which pypy > /dev/null; then
	PYTHON="pypy"
else
	PYTHON="python"
fi

# Set JS runtime
NODE="node"

time $NODE $@ &&
time "$TRAVIOLI_DIR/bin/collect_trace.sh" "$TRAVIOLI_DIR/node_modules/jalangi2" $@ && 
time $PYTHON "$TRAVIOLI_DIR/src/py/readtrace.py" && 
tail -3 "travioli/traversals.out"

