#/bin/sh

cat ../conf/nginx1.conf > ../nginx.conf

docker ps | grep user | awk '{print $13}'| cut -b 1-13 | sed "s/0.0.0.0/server $HOSTNAME/"| sed 's/$/;/' >> ../nginx.conf

cat ../conf/nginx2.conf >> ../nginx.conf
cd ..
docker build -t jkepeer1/loadbalanser .
docker run -d -p 80:80 jkepeer1/loadbalanser
