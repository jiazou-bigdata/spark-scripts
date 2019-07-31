#STEP 1.
#start VMs from one VPC

#STEP 2.
#modify hostname and hosts
#sudo vi /etc/hostname
#sudo vi /etc/hosts
#sudo reboot

#STEP 3.
#configure ssh
#ssh-keygen -t rsa
#cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
#scp authorized_keys ubuntu@worker1:~/.ssh
#scp authorized_keys ubuntu@worker2:~/.ssh
#chmod 600 .ssh/authroized_keys

#STEP 4.
#create directories

sudo chown ubuntu:ubuntu /mnt
mkdir /mnt/dfs
mkdir /mnt/dfs/name
mkdir /mnt/dfs/data
mkdir /home/ubuntu/hadoop
mkdir /home/ubuntu/hadoop/tmp
mkdir /mnt/spark
mkdir /mnt/spark/work

#STEP 5.
#sync files using sshWorkers.sh

#STEP 6
#start hadoop
