#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chnroute.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  echo "add address=$net disabled=no comment=AS4809 list=china-ip"
done

} > ../CN.rsc

cd ..
rm -rf ./pbr
