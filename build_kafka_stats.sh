#!/bin/bash

BASEDIR=$(dirname $0)
BASE="base_kafka_stats.sh"
JMX="cmdline-jmxclient-0.10.3.jar"
OUT="kafka_stats.sh"

[ -f "$BASEDIR/$JMX" ] && rm -f "$BASEDIR/$JMX"
wget http://crawler.archive.org/cmdline-jmxclient/$JMX

if [ $? -ne 0 ]; then
    echo "Error downloading JMX client! (Do you need to set a proxy?) Aborting ..."
    exit 1
fi


cat $BASE $JMX > $OUT && chmod +x $OUT

echo "Done building new $OUT !"
