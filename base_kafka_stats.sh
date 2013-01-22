#!/bin/bash
# Author: "ML Cloudbuilders"
# Copyright: "CloudBuilders ( Alejandrito, Leitan, Maximilianito, Mex )"
# License: "GPL"

JMX_HOST=$1
JMX_PORT=$2
STATS_TYPE=$3
STATS_ACTION=$4

if [ $# -lt 3 ]; then
        echo "Usage:
                $0 <JMX_HOST> <JMX_PORT> <STATS_TYPE> [STATS_ACTION]

    <STATS_TYPE>
        Producer stats: KafkaProducerStats      AsyncProducerStats
        Consumer stats: ConsumerStats           ConsumerAllTopicStat    SimpleConsumerStats
"
        exit 1
fi

[ "x${STATS_TYPE}" == "xAsyncProducerStats" ] && BEAN_PREFIX="kafka.producer.Producer:type=" || BEAN_PREFIX="kafka:type=kafka."

java -jar $0 - ${JMX_HOST}:${JMX_PORT} ${BEAN_PREFIX}${STATS_TYPE} ${STATS_ACTION}
exit 0
