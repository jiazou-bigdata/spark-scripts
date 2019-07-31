Step 1. Start the Master using AMI: Jia-PDB-Spark-AutoBackup-Tensorflow

Step 2. Start the Workers using AMI: Jia-PDB-Spark-Hadoop-Worker

Step 3. Configure all nodes, including Master and Workers:
     [3.1] create a file called serverlist on master node, put it as /home/ubuntu/serverlist, including the hostname of all other nodes, like following:
ip-172-30-4-1
ip-172-30-4-2
ip-172-30-4-3
     [3.2] add ip-hostname mapping for all nodes (including master) into master node's /etc/hosts file, like following
172.30.4.1 ip-172-30-4-1
172.30.4.2 ip-172-30-4-2
172.30.4.3 ip-172-30-4-3
172.30.4.4 ip-172-30-4-4
         [3.3] sync /etc/hosts to all nodes
./syncDNS.sh ubuntu ObjectQueryModel/conf/yourPEMFILE.pem serverlist
     [3.4] sync server list to all nodes
./scpWorkers.sh ubuntu ObjectQueryModel/conf/yourPEMFILE.pem ~/serverlist "serverlist" "/home/ubuntu/"

     [3.5] copy pem file to every node and put it under ObjectQueryModel/conf/
./scpWorkers.sh ubuntu ObjectQueryModel/conf/yourPEMFILE.pem ~/serverlist "ObjectQueryModel/conf/yourPEMFILE.pem" "/home/ubuntu/ObjectQueryModel/conf/"
     [3.6] setup password-less ssh by run following on each node:
~/passfree.sh ubuntu ObjectQueryModel/conf/yourPEMFILE.pem serverlist
     [3.7] configure Spark and Hadoop by change the configurations in ~/hadoop_conf and ~/spark_conf
      cp ~/serverlist ~/hadoop_conf/slaves
      cp ~/serverlist ~/spark_conf/slaves
      NOTE: you need change master hostname in those files into your master hostname

Step 4. Sync configuration files to each node:
~/syncfiles.sh ubuntu ObjectQueryModel/conf/YourPEMFILE serverlist
Step 5. start hadoop and spark by run following on master node
~/startAll.sh

If you want to stop the system without removing data from HDFS and restart then you can use ~/softStop.sh and ~/restartAfterSoftStop.sh

Binhang's Update set up a Ganglia cluster:

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


