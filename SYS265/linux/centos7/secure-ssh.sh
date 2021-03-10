#!/bin/bash
# secure-ssh.sh
# author mirpag
# creates a new ssh user using $1 parameter
# adds a public key from the local repo or curled from the remote repo
# removes roots ability to ssh in
echo "Running script..." 

echo "ADD USER"
sudo useradd -m -d /home/$1 -s /bin/bash $1
echo "mkdir"
sudo mkdir /home/$1/.ssh
echo "copy pub key"
sudo cp /Tech_Journal/SYS265/linux/public-keys/id_rsa.pub /home/$1/.ssh/authorized_keys
echo "chmod .ssh"
sudo chmod 700 /home/$1/.ssh
echo "chmod .ssh/authorized_keys"
sudo chmod 600 /home/$1/.ssh/authorized_keys
echo "chown .ssh"
sudo chown -R $1:$1 /home/$1/.ssh
