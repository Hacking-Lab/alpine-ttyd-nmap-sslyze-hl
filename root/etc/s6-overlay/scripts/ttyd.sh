#!/command/with-contenv bash

set -euo pipefail

echo "================================="
echo "${HL_USER_USERNAME:-}"
echo "================================="

# shellcheck disable=SC1091
source /etc/hluser

homedir=$(getent passwd "$HL_USER_USERNAME" | cut -d: -f6)
userid=$(id -u "$HL_USER_USERNAME")
groupid=$(id -g "$HL_USER_USERNAME")

if [ -z "$homedir" ] || [ ! -d "$homedir" ]; then
    echo "Home directory for $HL_USER_USERNAME not found: $homedir" >&2
    exit 1
fi

cd "$homedir"
echo "running ttyd with the uid: $userid"
echo "running ttyd with the gid: $groupid"
echo "running ttyd in the following homedir: $homedir"
echo "permissions in $homedir"
ls -al "$homedir"
ls -lt /

exec /usr/local/bin/ttyd -W -u "$userid" -g "$groupid" bash --rcfile /etc/bashrc
