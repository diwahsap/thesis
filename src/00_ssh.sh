echo "SSH Keys"
sudo apt-get install -y ssh
sudo apt-get install -y sshd
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod og-wx ~/.ssh/authorized_keys