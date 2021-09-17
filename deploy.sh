#!/bin/bash
rm -rf asyio.tar.gz
tar -zcvf  easyio.tar.gz main.js package.json  public LICENSE
scp easyio.tar.gz root@172.31.7.230:~
ssh root@172.31.7.230 << 'ENDSSH'
pm2 stop all
mkdir easyio
tar -xvf easyio.tar.gz -C easyio
rm easyio.tar.gz
cd easyio 
npm install
node main.js
ENDSSH
