$HADOOP_HOME/sbin/stop-all.sh
$SPARK_HOME/sbin/stop-all.sh
$SPARK_HOME/sbin/stop-history-server.sh
~/sshWorkers.sh ubuntu ~/ObjectQueryModel/conf/aaa10.pem ~/serverlist 'rm -rf /mnt/spark'
~/sshWorkers.sh ubuntu ~/ObjectQueryModel/conf/aaa10.pem ~/serverlist 'rm -rf /mnt/dfs'
