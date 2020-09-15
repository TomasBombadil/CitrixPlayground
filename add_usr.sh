# Args
	while getopts k: flag
do
    case "${flag}" in
        k) sshPubKey=${OPTARG};;
    esac
done

# Add user with no rights for deployment process
# User with nogroup as group id and no password login
user="deploy"
homeDir="/home/$user"

# Probably some file locking here would be good
cp /etc/passwd /etc/passwd.backup
echo "deploy:*:65533:65534::$homeDir:/bin/bash" >> /etc/passwd

# Set homedir
mkdir $homeDir
chown -R $user:nogroup $homeDir
chmod -R 700 $homeDir

# Set ssh access
mkdir $homeDir/.ssh
chmod -R 755 $homeDir/.ssh

echo $sshPubKey > $homeDir/.ssh/authorized_keys
chown $user:nogroup $homeDir/.ssh/authorized_keys
chmod 600 $homeDir/.ssh/authorized_keys





