user=$1
key=$2
serverlist=$3
#Prerequisite: add ip-hostname mapping for all nodes into each node's /etc/hosts file
#cat /etc/hosts | ssh otherhost "sudo sh -c 'cat >/etc/hosts'" do the trick

arr=($(awk '{print $0}' $serverlist))
length=${#arr[@]}
echo "There are $length servers"
for (( i=0 ; i<$length ; i++ ))
do
        host=${arr[i]}
        echo -e "\n+++++++++++ reconfig: $host"
        cat /etc/hosts | ssh -i $key $user@$host "sudo sh -c 'cat >/etc/hosts'"
done
