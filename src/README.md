# Tutorial init instance menggunakan Terraform
1. Install Terraform terlebih dahulu
2. Buat token untuk mengakses API dari Digital Ocean melalui link berikut: https://cloud.digitalocean.com/account/api/tokens
3. Pindah ke foldere terraform dan buka berkas provider.tf. Isi token yang sudah dibuat pada langkah 2 pada baris 13.
4. Jalankan perintah `terraform init` untuk menginisialisasi instance.
4. Jalankan perintah `terraform plan` untuk melihat perubahan yang akan dilakukan.
5. Jalankan perintah `terraform apply` untuk membuat instance.
6. Jalankan perintah `terraform destroy` untuk menghapus instance.
