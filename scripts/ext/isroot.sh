# Make sure only root can run our script
# --------------------------------------
# Usage:
# source $(dirname $0)/ext/isroot.sh
# --------------------------------------


if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi