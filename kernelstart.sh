#!/usr/bin/env bash

# get path to THIS script to use as root. DOES NOT WORK IF THE SCRIPT IS A SIMULINK
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# add ./src dir to pythonpath
export PYTHONPATH="$DIR/src:$PYTHONPATH"

# ONCE ALL THE ENV VARIABLES ARE SET, START AN IPYTHON KERNEL WITH ALL PARAMS PASSED TO `jupyter notebook`
exec python3 -m ipykernel $@

# PS - IF THE SCRIPT IS A SIMULINK, YOU NEED A MULTILINE SOLUTION

# SOURCE="${BASH_SOURCE[0]}"
# while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
#   DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
#   SOURCE="$(readlink "$SOURCE")"
#   [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
# done
# DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

# BASED ON - https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself/246128#246128