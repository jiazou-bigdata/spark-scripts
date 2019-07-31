data=$1
$HADOOP_HOME/bin/hdfs dfs -mkdir /input
$HADOOP_HOME/bin/hdfs dfs -mkdir /output
$HADOOP_HOME/bin/hdfs dfs -put  $data /input/
$HADOOP_HOME/bin/hdfs dfs -rm /perf-bench-1.0.jar
$HADOOP_HOME/bin/hdfs dfs -put  /home/ubuntu/perf-bench/target/perf-bench-1.0.jar /
$HADOOP_HOME/bin/hdfs dfs -ls /
$HADOOP_HOME/bin/hdfs dfs -ls /input/
