#!/command/with-contenv bash


echo "================================="
echo $HL_USER_USERNAME
echo "================================="

source /etc/hluser

homedir=$( getent passwd "$HL_USER_USERNAME" | cut -d: -f6 )
userid=$( id -u "$HL_USER_USERNAME" ) 
groupid=$( id -g "$HL_USER_USERNAME" )
cd $homedir
echo "running ttyd with the uid: " $userid
echo "running ttyd with the gid: " $groupid
echo "running ttyd in the following homedir: " $homedir
echo "permissions in $homedir"
ls -al $homedir
ls -lt /



exec /usr/local/bin/ttyd -W -u $userid -g $groupid bash --rcfile /etc/bashrc;
#exec ttyd -B -u $userid -g $groupid bash --rcfile /etc/bashrc;
