FROM       ubuntu:latest
MAINTAINER "Kohei Saito" "kk.31108424@gmail.com"

RUN echo "Build has started..."

# タイムゾーン
RUN echo "Asia/Tokyo" > /etc/timezone

# Install required Linux packages
RUN apt-get update
RUN apt-get -y install wget
RUN apt-get -y install unzip

#Install Java 1.8
RUN apt-get install openjdk-8-jre

# Install GlassFish 5
# WIP


# Setup environment variables
# WIP

# Allow Derby to start as daemon (used by some Java EE app, such as Pet Store)
# WIP

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
