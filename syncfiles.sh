user=$1
key=$2
serverlist=$3
cp ~/hadoop_conf/* $HADOOP_HOME/etc/hadoop/
cp ~/spark_conf/* $SPARK_HOME/conf/
./scpWorkers.sh $user $key $serverlist "$HOME/hadoop_conf/core-site.xml" "$HADOOP_HOME/etc/hadoop/"
./scpWorkers.sh $user $key $serverlist "$HOME/hadoop_conf/hadoop-env.sh" "$HADOOP_HOME/etc/hadoop/"
./scpWorkers.sh $user $key $serverlist "$HOME/hadoop_conf/hdfs-site.xml" "$HADOOP_HOME/etc/hadoop/"
./scpWorkers.sh $user $key $serverlist "$HOME/hadoop_conf/mapred-site.xml" "$HADOOP_HOME/etc/hadoop/"
./scpWorkers.sh $user $key $serverlist "$HOME/hadoop_conf/slaves" "$HADOOP_HOME/etc/hadoop/"
./scpWorkers.sh $user $key $serverlist "$HOME/hadoop_conf/yarn-env.sh" "$HADOOP_HOME/etc/hadoop/"
./scpWorkers.sh $user $key $serverlist "$HOME/hadoop_conf/yarn-site.xml" "$HADOOP_HOME/etc/hadoop/"
./scpWorkers.sh $user $key $serverlist "$HOME/spark_conf/slaves $HOME/spark_conf/spark-defaults.conf $HOME/spark_conf/spark-env.sh" "$SPARK_HOME/conf/"
