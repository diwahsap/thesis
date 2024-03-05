#!/bin/bash

# Fungsi untuk menampilkan pesan langkah
show_step() {
    echo "======================================================"
    echo "Langkah $1: $2"
    echo "======================================================"
}

# Langkah 1: Unduh Hadoop
show_step "1" "Unduh Hadoop"
cd /usr/local
sudo wget https://archive.apache.org/dist/hadoop/common/hadoop-3.2.0/hadoop-3.2.0.tar.gz
sudo tar xvzf hadoop-3.2.0.tar.gz
sudo mv hadoop-3.2.0 hadoop

# Langkah 2: Mengubah Kepemilikan Berkas Hadoop
show_step "2" "Mengubah Kepemilikan Berkas Hadoop"
sudo chown -R hdfsuser:hadoop /usr/local/hadoop
sudo chmod -R 777 /usr/local/hadoop

# Langkah 3: Mematikan IPv6 Networks
show_step "3" "Mematikan IPv6 Networks"
echo "cat /proc/sys/net/ipv6/conf/all/disable_ipv6"
echo "# Disable ipv6
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Langkah 4: Menambahkan Hadoop pada Environments Variables
show_step "4" "Menambahkan Hadoop pada Environments Variables"
echo "# HADOOP ENVIRONMENT
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop
export HADOOP_MAPRED_HOME=/usr/local/hadoop
export HADOOP_COMMON_HOME=/usr/local/hadoop
export HADOOP_HDFS_HOME=/usr/local/hadoop
export YARN_HOME=/usr/local/hadoop
export PATH=\$PATH:/usr/local/hadoop/bin
export PATH=\$PATH:/usr/local/hadoop/sbin

# HADOOP NATIVE PATH
export HADOOP_COMMON_LIB_NATIVE_DIR=\$HADOOP_HOME/lib/native
export HADOOP_OPTS=-Djava.library.path=\$HADOOP_PREFIX/lib" | sudo tee -a ~/.bashrc
source ~/.bashrc

# Langkah 5: Konfigurasi Hadoop
show_step "5" "Konfigurasi Hadoop"
cd /usr/local/hadoop/etc/hadoop/
sudo cp ~/tugas-akhir/src/hadoop/core-site.xml .
sudo cp ~/tugas-akhir/src/hadoop/hadoop-env.sh .
sudo cp ~/tugas-akhir/src/hadoop/hdfs-site.xml .
sudo cp ~/tugas-akhir/src/hadoop/mapred-site.xml .
sudo cp ~/tugas-akhir/src/hadoop/yarn-site.xml .

# Langkah 6: Membuat Direktori Hadoop untuk Menyimpan Data
show_step "6" "Membuat Direktori Hadoop untuk Menyimpan Data"
sudo mkdir -p /bigdata/hadoop/tmp
sudo chown -R hdfsuser:hadoop /bigdata/hadoop/tmp
sudo chmod -R 777 /bigdata/hadoop/tmp

sudo mkdir -p /usr/local/hadoop/yarn_data/hdfs/namenode
sudo mkdir -p /usr/local/hadoop/yarn_data/hdfs/datanode
sudo chmod -R 777 /usr/local/hadoop/yarn_data/hdfs/namenode
sudo chmod -R 777 /usr/local/hadoop/yarn_data/hdfs/datanode
sudo chown -R hdfsuser:hadoop /usr/local/hadoop/yarn_data/hdfs/namenode
sudo chown -R hdfsuser:hadoop /usr/local/hadoop/yarn_data/hdfs/datanode

# Langkah 7: Menjalankan Hadoop
show_step "7" "Menjalankan Hadoop"
hdfs namenode -format
start-all.sh
jps
