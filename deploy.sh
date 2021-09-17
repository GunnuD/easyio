#!/bin/bash
ssh root@172.31.7.230 << 'ENDSSH'
pm2 stop all
mkdir easyio
tar -xvf easyio.tar.gz -C easyio
rm easyio.tar.gz
cd easyio 
npm install
node main.js
ENDSSH
