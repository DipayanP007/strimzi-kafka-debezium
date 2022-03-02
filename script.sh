# Run a producer and Consumer Pod
-> kubectl run kafka-consumer --restart='Never' --image docker.io/bitnami/kafka:3.1.0-debian-10-r20 --command -- sleep infinity
-> kubectl run kafka-producer --restart='Never' --image docker.io/bitnami/kafka:3.1.0-debian-10-r20 --command -- sleep infinity

# Exec into producer pod and run
kafka-console-producer.sh \
  --broker-list kafka-cluster-kafka-bootstrap.kafka.svc.cluster.local:9092 \
  --topic test

# Exec into consumer pod and run
kafka-console-consumer.sh \
  --bootstrap-server kafka-cluster-kafka-bootstrap.kafka.svc.cluster.local:9092 \
  --topic test \
  --from-beginning



# Check replication slot
select * from pg_replication_slots;
# Drop replication slot
select pg_drop_replication_slot(‘SLOT_NAME’);
