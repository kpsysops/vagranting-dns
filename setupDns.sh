#!/bin/bash
echo "Instaling DNS resoultion for example.com with bind9" | logger 
sudo yum -y install bind bind-utils 

