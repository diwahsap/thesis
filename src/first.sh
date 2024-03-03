#!/bin/bash

# Fungsi untuk mengecek dan menginstal paket jika belum terpasang
install_package() {
    if ! dpkg -s "$1" &> /dev/null; then
        sudo apt-get install -y "$1"
    fi
}

echo "Langkah 1: Pembaruan package management"
sudo apt update
echo "Pembaruan selesai."

echo "Langkah 2: Membuat Pengguna Baru"
sudo addgroup hadoop
sudo adduser --ingroup hadoop hdfsuser
echo "hdfsuser ALL=(ALL:ALL) ALL" | sudo tee -a /etc/sudoers
sudo su - hdfsuser
echo "Pengguna baru berhasil dibuat."
echo "Saat ini sedang digunakan sebagai pengguna: $(whoami)"

echo "Langkah 3: Pengaturan SSH keys untuk Hadoop"
install_package ssh
install_package sshd
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod og-wx ~/.ssh/authorized_keys
ssh localhost
echo "Pengaturan SSH keys selesai."

echo "Langkah 4: Instalasi Git"
install_package git
git --version
echo "Instalasi Git selesai."

echo "Langkah 5: Instalasi Python"
install_package python2
install_package python3.7
python --version
echo "Instalasi Python selesai."

echo "Langkah 6: Instalasi Java dan Maven"
sudo mkdir -p /opt/java
cd /opt/java || exit
sudo apt-get -y install wget
sudo wget https://repo.huaweicloud.com/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz
sudo tar zxvf jdk-7u80-linux-x64.tar.gz
sudo update-alternatives --install /usr/bin/java java /opt/java/jdk1.7.0_80/bin/java 0
sudo update-alternatives --install /usr/bin/javac javac /opt/java/jdk1.7.0_80/bin/javac 0
java -version
sudo apt-get -y install maven
mvn -version
echo "Instalasi Java dan Maven selesai."

echo "Langkah 7: Instalasi Scala"
sudo wget https://downloads.lightbend.com/scala/2.11.0/scala-2.11.0.deb
sudo dpkg -i scala-2.11.0.deb
scala -version
echo "Instalasi Scala selesai."

echo "Seluruh langkah selesai."
