echo "Instaling DNS resoultion for example.com with bind9" | logger 
#Install dns packages
sudo yum -y install bind bind-utils 
#Copy config files from vagrant dir (no addional changes needed) 
cp /vagrant/10.10.10.db /var/named/10.10.10.db
cp /vagrant/example.com.db  /var/named/example.com.db
cp /vagrant/named.conf /etc/named.conf

chown root:named /var/named/10.10.10.db
chown root:named /var/named/example.com.db
chown root:named /etc/named.conf

#Start and enable dns daemon (bind9)
sudo systemctl --now enable named
sudo firewall-cmd --permanent --zone=public --add-service=dns
sudo firewall-cmd --reload

#Adding DNS IP to DNS server
ETH0=$(sudo nmcli connection show | grep eth0 | cut -d ' ' -f 4)
ETH1=$(sudo nmcli connection show | grep eth1 | cut -d ' ' -f 4)
sudo nmcli connection modify $ETH0 ipv4.dns-priority 10
sudo nmcli connection modify $ETH1 ipv4.dns-priority 1
sudo nmcli connection modify $ETH1  ipv4.dns 10.10.10.2
sudo nmcli connection modify $ETH1  ipv4.dns-search example.com
sudo nmcli connection up $ETH1 
sudo nmcli connection up $ETH0 




