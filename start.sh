#!/bin/bash

#替换redis信息

sed -i 's/REDIS_MASTER_01/'$MY_REDIS_MASTER_01'/g'  ./nutcracker.leaf.yml.template
sed -i 's/REDIS_MASTER_02/'$MY_REDIS_MASTER_02'/g'  ./nutcracker.leaf.yml.template
sed -i 's/REDIS_MASTER_03/'$MY_REDIS_MASTER_03'/g'  ./nutcracker.leaf.yml.template
sed -i 's/REDIS_MASTER_04/'$MY_REDIS_MASTER_04'/g'  ./nutcracker.leaf.yml.template
sed -i 's/REDIS_MASTER_05/'$MY_REDIS_MASTER_05'/g'  ./nutcracker.leaf.yml.template

sed -i 's/PORT_01/'$MY_REDIS_PORT_01'/g'  ./nutcracker.leaf.yml.template
sed -i 's/PORT_02/'$MY_REDIS_PORT_02'/g'  ./nutcracker.leaf.yml.template
sed -i 's/PORT_03/'$MY_REDIS_PORT_03'/g'  ./nutcracker.leaf.yml.template
sed -i 's/PORT_04/'$MY_REDIS_PORT_04'/g'  ./nutcracker.leaf.yml.template
sed -i 's/PORT_05/'$MY_REDIS_PORT_05'/g'  ./nutcracker.leaf.yml.template

cp -rf nutcracker.leaf.yml.template  ./conf/nutcracker.leaf.yml

./src/nutcracker -d -c ./conf/nutcracker.leaf.yml
