sudo apt-get update 
sudo apt-get upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
sudo apt install docker-ce -y
sudo git init
sudo git clone https://github.com/leiperjack/refresh
cd refresh
sudo docker build -t webpage/leiperjack:latest . 
sudo docker run --restart always -d -p 3002:80 webpage/leiperjack