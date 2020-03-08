$HADOOP_HOME/bin/hdfs dfs -mkdir /eventLogs
$HADOOP_HOME/bin/hdfs dfs -mkdir /eventLogs/applicationHistory
$HADOOP_HOME/bin/hdfs dfs -chown ubuntu:ubuntu /eventLogs
$HADOOP_HOME/bin/hdfs dfs -chmod 1770 /eventLogs/applicationHistory
