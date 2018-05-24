#/bin/sh


echo  "upstream user1 {" > default.conf
docker ps|grep -v CONTAINER|grep user1|awk '{print $1}'|xargs docker inspect --format '{{ .NetworkSettings.IPAddress }}'|awk '{print "server " $1 ":80;"}' >> default.conf
echo  "}" >> default.conf

echo  "upstream user2 {" >> default.conf
docker ps|grep -v CONTAINER|grep user2|awk '{print $1}'|xargs docker inspect --format '{{ .NetworkSettings.IPAddress }}'|awk '{print "server " $1 ":80;"}' >> default.conf
echo  "}" >> default.conf

cat ../conf/nginx2.conf >> default.conf
cd ..
docker build -t jkepeer1/loadbalanser .
docker run -d -p 80:80 jkepeer1/loadbalanser
