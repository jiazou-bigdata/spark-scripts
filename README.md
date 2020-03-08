Spark scripts on AWS.

# Prerequisite:

Master node needs to have a copy of hadoop and spark package. 

wget https://downloads.apache.org/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz

tar xvf hadoop-2.7.7.tar.gz

wget https://downloads.apache.org/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz

tar xvf spark-2.4.5-bin-hadoop2.7.tgz

Configure ~/.bashrc on every node

Add:

export HADOOP_HOME=/home/ubuntu/hadoop-2.7.7

export SPARK_HOME=/home/ubuntu/spark-2.4.5-bin-hadoop2.7

and run 

source ~/.bashrc

In this manual, we copy all the files/folders in spark-scripts to /home/ubuntu:

cp -R spark-scripts/* /home/ubuntu/


# Step 1. Configure all nodes, including Master and Workers:

[1.1] create a file called serverlist on master node, put it as /home/ubuntu/serverlist, including the hostname of all other nodes, like following:

ip-172-30-4-1

ip-172-30-4-2

ip-172-30-4-3

[1.2] add ip-hostname mapping for all nodes (including master) into master node's /etc/hosts file, like following

172.30.4.1 ip-172-30-4-1

172.30.4.2 ip-172-30-4-2

172.30.4.3 ip-172-30-4-3

172.30.4.4 ip-172-30-4-4

[1.3] sync /etc/hosts to all nodes

./syncDNS.sh ubuntu $path-to-yourPEMFILE $path-to-serverlist

[1.4] sync server list to all nodes

./scpWorkers.sh ubuntu $path-to-yourPEMFILE $path-to-serverlist $path-to-serverlist $path-to-serverlist-on-worker

[1.5] copy pem file to every node and put it under $path-to-yourPEMFILE-on-worker

./scpWorkers.sh ubuntu $path-to-yourPEMFILE $path-to-serverlist $path-to-yourPEMFILE $path-to-yourPEMFILE-on-worker

[1.6] setup password-less ssh by run following on each node:

./passfree.sh ubuntu $path-to-yourPEMFILE $path-to-serverlist

[1.7] copy the tarball to all workers under /home/ubuntu/ and decompress these tarballs

./scpWorkers.sh ubuntu $path-to-yourPEMFILE $path-to-serverlist /home/ubuntu/hadoop-2.7.7.tar.gz /home/ubuntu/

./scpWorkers.sh ubuntu $path-to-yourPEMFILE $path-to-serverlist /home/ubuntu/spark-2.4.5-bin-hadoop2.7.tgz /home/ubuntu/

./sshWorkers.sh ubuntu $path-to-yourPEMFILE $path-to-serverlist "tar xvf hadoop-2.7.7.tar.gz; tar xvf spark-2.4.5-bin-hadoop2.7.tgz"


[1.8] configure Spark and Hadoop by change the configurations in ~/conf/hadoop_conf and ~/conf/spark_conf

      cp ~/serverlist ~/conf/hadoop_conf/slaves
      
      cp ~/serverlist ~/conf/spark_conf/slaves
      
      NOTE: you need change master hostname in those files into your master hostname (use command:
      
      cd ~/conf/spark_conf
      
      sed -i 's/$oldHost/$newHost/g' *
      
      cd ~/conf/hadoop_conf
      
      sed -i 's/$oldHost/$newHost/g' *
      
      to simplify the configuration)

# Step 2. Sync configuration files to each node:

~/syncfiles.sh ubuntu $path-to-yourPEMFILE $path-to-serverlist

# Step 3. start hadoop and spark by run following on master node

Note: every node needs to install java and have JAVA_HOME specified

~/sshWorkers.sh ubuntu $path-to-yourPEMFILE $path-to-serverlist "sudo apt-get install default-jdk"
~/sshWorkers.sh ubuntu $path-to-yourPEMFILE $path-to-serverlist "sudo apt-get install default-jre"

~/startAll.sh

If you want to stop the system without removing data from HDFS and restart then you can use ~/softStop.sh and ~/restartAfterSoftStop.sh

# Update set up a Ganglia cluster:

On each worker node, edit the /etc/ganglia/gmond.conf file:

Add a line to the udp_send_channel block for the host, which should be the IP address of your master Ganglia node (e.g. 1.1.1.1). Comment out the mcast_join line.

[...]
udp_send_channel {
  #mcast_join = 239.2.11.71   ## Comment
  host = 1.1.1.1   ## IP address of master node
  port = 8649
  ttl = 1
}
[...]
Comment out the whole udp_recv_channel section with the /* ... */ syntax, as this server won't be receiving anything.

[...]
/* You can specify as many udp_recv_channels as you like as well.
udp_recv_channel {
  mcast_join = 239.2.11.71
  port = 8649
  bind = 239.2.11.71
}
*/
[...]
Restart the monitoring service.

sudo service ganglia-monitor restart




