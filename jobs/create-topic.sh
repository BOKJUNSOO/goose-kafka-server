#!/bin/bash

# Kafka bootstrap server
BOOTSTRAP_SERVER="kafka:9093"

# 토픽 목록
TOPICS=(
  "news-search-topic"
  "top5-keywords"
)

# 각 토픽 생성
for TOPIC in "${TOPICS[@]}"; do
  echo "Now Creating topic..: $TOPIC"
  kafka-topics.sh --create \
    --topic "$TOPIC" \
    --bootstrap-server "$BOOTSTRAP_SERVER" \
    --partitions 1 \
    --replication-factor 1
done
