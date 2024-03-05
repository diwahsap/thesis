echo "Langkah 5: Instalasi Git."
sudo apt install -y git
git --version
echo "Langkah 6: Instalasi Python."
sudo apt-get install -y python2
sudo apt-get install -y python3.7
python --version
echo "Langkah 7: Instalasi Java 8 dan Maven."
sudo apt install -y openjdk-8-jre-headless openjdk-8-jdk
java -version
sudo apt-get install -y maven
mvn -version
echo "Langkah 8: Instalasi Scala."
sudo wget https://downloads.lightbend.com/scala/2.12.0/scala-2.12.0.deb
sudo dpkg -i scala-2.12.0.deb
scala -version

echo "Seluruh langkah selesai."