testName=$1
input=$2
output=$3
hostname=$4

echo $hostname

~/updateJar.sh
$HADOOP_HOME/bin/hdfs dfs -rm -r /output/$output
$SPARK_HOME/bin/spark-submit --class edu.rice.bench.$testName --master spark://$hostname:7077 --deploy-mode cluster hdfs://$hostname:9000/perf-bench-1.0.jar hdfs://$hostname:9000/input/$input hdfs://$hostname:9000/output/$output
