SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
KERNEL_START_SCRIPT="${SETUP_DIR}/kernelstart.sh"

# construct kernel.json
jq \
--arg display_name "$1" \
--arg kernel_start_script "${KERNEL_START_SCRIPT}" \
'.["display_name"]=$display_name | .argv[2]=$kernel_start_script' \
< kernel.json.template > kernel.json

echo "Generated the following kernel specs :"
cat kernel.json

# setup kernel spec if not already there
ipython kernel install --user --name $1

# put kernel.json spec where it belongs
cp kernel.json $HOME/.local/share/jupyter/kernels/$1/