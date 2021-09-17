#!/bin/bash

tar czf easyio.tar.gz main.js package.json public LICENSE
scp easyio.tar.gz 172.31.7.230:~
rm easyio.tar.gz

ssh 172.31.7.230 << 'ENDSSH'
pm2 stop all
rm -rf easyio
mkdir easyio
tar xf easyio.tar.gz -C easyio
rm easyio.tar.gz
cd easyio 
npm i
pm2 start all
ENDSSH
