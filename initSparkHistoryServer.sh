hdfs dfs -mkdir /eventLogs
hdfs dfs -mkdir /eventLogs/applicationHistory
hdfs dfs -chown ubuntu:ubuntu /eventLogs
hdfs dfs -chmod 1770 /eventLogs/applicationHistory
