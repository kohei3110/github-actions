FROM       ubuntu:latest
MAINTAINER "Kohei Saito" "kk.31108424@gmail.com"

# タイムゾーン
RUN echo "Asia/Tokyo" > /etc/timezone

# ロケールの設定
RUN locale-gen en_US.UTF-8
RUN locale-gen ja_JP.UTF-8
RUN update-locale LANG=ja_JP.UTF-8 

# Install required Linux packages
RUN apt-get update
RUN apt-get -y install wget
RUN apt-get -y install unzip

#Install Java 1.8
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \ 
  apt-get update && \
  apt-get install software-properties-common -y && \ 
  add-apt-repository -y ppa:webupd8team/java -y && \
  apt-get update && \
  apt-get install oracle-java8-installer -y && \
  apt-get install oracle-java8-set-default && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Install GlassFish 5
# WIP


# Setup environment variables
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH $PATH:$JAVA_HOME/bin:$GF_HOME/bin

# Allow Derby to start as daemon (used by some Java EE app, such as Pet Store)
RUN echo "grant { permission java.net.SocketPermission \"localhost:1527\", \"listen\"; };" >> $JAVA_HOME/jre/lib/security/java.policy

# Secure GF installation with a password and authorize network access
# WIP

# Add our GF startup script
# WIP

# PORT FORWARD THE ADMIN PORT, HTTP LISTENER-1 PORT, HTTPS LISTENER PORT, PURE JMX CLIENTS PORT, MESSAGE QUEUE PORT, IIOP PORT, IIOP/SSL PORT, IIOP/SSL PORT WITH MUTUAL AUTHENTICATION
#EXPOSE 4848 8080 8181 8686 7676 3700 3820 3920
# ElasticBeanstalk only expose first port
EXPOSE 8080 4848

# deploy an application to the container
# example below - it uses the auto-deploy service of Glassfish
# WIP