#!/bin/sh
echo "Configure JAVA ENV..."
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
export LANG='en_US.UTF-8'
export LANGUAGE='en_US:en'
export LC_ALL='en_US.UTF-8'

#sudo apt-get -qq update && \
#     apt-get -qq -y --no-install-recommends install gnupg software-properties-common locales curl && \
#     locale-gen en_US.UTF-8 
