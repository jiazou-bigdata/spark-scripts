user=$1
key=$2
serverlist=$3

$HADOOP_HOME/sbin/stop-all.sh
$SPARK_HOME/sbin/stop-all.sh
$SPARK_HOME/sbin/stop-history-server.sh
~/sshWorkers.sh $user $key $serverlist 'rm -rf ~/hadoop_data'
~/sshWorkers.sh $user $key $serverlist 'rm -rf ~/spark'
