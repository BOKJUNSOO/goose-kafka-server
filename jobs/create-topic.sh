kafka-topics.sh --create \
                --topic my-topic \
                --bootstrap-server kafka:9093 \
                --partitions 1 \
                --replication-factor 1