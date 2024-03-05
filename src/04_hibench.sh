#!/bin/bash

# Fungsi untuk menampilkan pesan langkah
show_step() {
    echo "======================================================"
    echo "Langkah $1: $2"
    echo "======================================================"
}

# Langkah 1: Unduh berkas HiBench
show_step "1" "Unduh berkas HiBench"
cd /home/hdfsuser
git clone https://github.com/Intel-bigdata/HiBench.git
sudo chmod 755 HiBench

# Langkah 2: Membangun framework benchmark
show_step "2" "Membangun framework benchmark"
cd HiBench
mvn -Phadoopbench -Psparkbench -Dhadoop=3.2 -Dspark=3.0 -Dmodules -Pmicro clean package

# Langkah 3: Installasi bc
show_step "3" "Installasi bc"
sudo apt install bc
