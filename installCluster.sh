user=$1
key=$2
serverlist=$3
#Step1. create a serverlist on each node, including the hostname of all other nodes
#Step2. add ip-hostname mapping for all nodes into each node's /etc/hosts file
#Step3. copy pem file to every node and put it under ObjectQueryModel/conf/
#Step4. setup password-less ssh by run following on each node
#./passfree.sh ubuntu ObjectQueryModel/conf/aaa10.pem serverlist
#Step5. configure files in $HOME/hadoop_conf and $HOME/spark_conf 
#Step6. sync configuration files to each node
./syncfiles.sh ubuntu ObjectQueryModel/conf/aaa10.pem serverlist
#Step7. start hadoop and spark by run following on master node
./startAll.sh

