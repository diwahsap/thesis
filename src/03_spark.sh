#!/bin/bash

# Fungsi untuk menampilkan pesan langkah
show_step() {
    echo "======================================================"
    echo "Langkah $1: $2"
    echo "======================================================"
}

# Langkah 1: Unduh Berkas Spark
show_step "1" "Unduh Berkas Spark"
cd /usr/local
sudo wget https://archive.apache.org/dist/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.4.tgz
sudo tar xvf spark-2.1.0-bin-hadoop2.4.tgz
sudo mv spark-2.1.0-bin-hadoop2.4 spark

# Langkah 2: Menambahkan Spark pada Environments Variables
show_step "2" "Menambahkan Spark pada Environments Variables"
echo "# SPARK ENVIRONMENT
export PATH=\$PATH:/usr/local/spark/
export YARN_CONF_DIR=\$HADOOP_HOME/etc/hadoop
export SPARK_HOME=/usr/local/spark/" | sudo tee -a ~/.bashrc
source ~/.bashrc

# Langkah 3: Menjalankan Spark Shell
show_step "3" "Menjalankan Spark Shell"
spark-submit --version
spark-shell --master yarn
