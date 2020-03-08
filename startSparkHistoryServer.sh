$HADOOP_HOME/bin/hdfs dfs -mkdir /applicationHistory
$HADOOP_HOME/bin/hdfs dfs -chown ubuntu:ubuntu /applicationHistory
$HADOOP_HOME/bin/hdfs dfs -chmod 1770 /applicationHistory
$SPARK_HOME/sbin/start-history-server.sh
