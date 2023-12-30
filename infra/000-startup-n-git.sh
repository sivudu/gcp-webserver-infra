cd ~
git clone https://github.com/sivudu/gcp-webserver-infra.git gcp-webserver-infra
cd gcp-webserver-infra/app-setup
chmod +x *.sh

./100-aliases.sh
./200-node.sh
./300-npm-setup.sh
