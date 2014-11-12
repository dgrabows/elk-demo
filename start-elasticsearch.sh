#!/bin/bash
es_home=elasticsearch-1.4.0

# min and max JVM heap size are set to this value
export ES_HEAP_SIZE=1g

# Give the cluster a unique name to avoid auto-discovery collisions with other elasticsearch nodes on the same network
es_config="-Des.cluster.name=1devday"

# Default indexes to having a single shard and no replicas.
# This makes sense for a single-node demo setup, but should be reconsidered for other scenarios.
es_config="${es_config} -Des.index.number_of_shards=1 -Des.index.number_of_replicas=0"

# Move the elasticsearch data and log directories outside of the elasticsearch install to make upgrading easier.
es_config="${es_config} -Des.path.data=var/data/elasticsearch -Des.path.logs=var/logs/elasticsearch"

# Have elasticsearch print out the maximum number of open file descriptors it is allowed when starting up.
es_config="${es_config} -Des.max-open-files" 

#${es_home}/bin/elasticsearch ${es_config} -p ${es_home}/es.pid -d
${es_home}/bin/elasticsearch ${es_config} -p ${es_home}/es.pid