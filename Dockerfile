FROM library/java:openjdk-7-jdk
MAINTAINER Dale-Kurt Murray "dalekurt.murray@gmail.com"

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q  wget unzip

RUN wget http://twofishes.net/binaries/server-assembly-0.84.9.jar -P /twofishes/2015-03-05-20-05-30.753698 \
	&& wget http://twofishes.net/indexes/revgeo/2015-03-05.zip -P /tmp \
	&& unzip /tmp/2015-03-05.zip \
	&& cp -fr /tmp/2015-03-05-20-05-30.753698 /twofishes/2015-03-05-20-05-30.753698

# Add (extracted) index directory
# ADD 2015-03-05-20-05-30.753698 /twofishes/2015-03-05-20-05-30.753698

# Add server binary
# ADD server-assembly-0.84.9.jar /twofishes/server-assembly-0.84.9.jar

EXPOSE 8080 8081 8082 8083
CMD java -jar /twofishes/server-assembly-0.84.9.jar --hfile_basepath /twofishes/2015-03-05-20-05-30.753698
