#!/bin/bash
cd /var/lib/zerotier-one
cp -rf /Server/mkmoonworld-x86_64 /var/lib/zerotier-one
chmod 777 mkmoonworld-x86_64
zerotier-idtool initmoon identity.public > moon.json
moonip="[\"$ZU_DEFAULT_IP_PROT\"]"
sed -i "s#\[\]#${moonip}#g" moon.json
cat moon.json
zerotier-idtool genmoon moon.json
./mkmoonworld-x86_64 moon.json
mkdir moons.d
cp *.moon moons.d
mv world.bin planet
file="/app/frontend/build/static/$ZU_DEFAULT_USERNAME"
if [ ! -d "$file" ]; then
 mkdir $file
fi
cp -f /var/lib/zerotier-one/planet /app/frontend/build/static/$ZU_DEFAULT_USERNAME
echo Run Planet is generated successfully...
