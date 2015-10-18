#!/bin/bash

cat <<EOF > /etc/apt/sources.list
deb http://httpredir.debian.org/debian wheezy main non-free contrib
deb-src http://httpredir.debian.org/debian wheezy main non-free contrib

deb http://security.debian.org/ wheezy/updates main contrib non-free
deb-src http://security.debian.org/ wheezy/updates main contrib non-free

# wheezy-updates, previously known as 'volatile'
deb http://httpredir.debian.org/debian wheezy-updates main contrib non-free
deb-src http://httpredir.debian.org/debian wheezy-updates main contrib non-free
EOF

apt-get update
