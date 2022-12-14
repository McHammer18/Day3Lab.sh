#!/bin/bash
echo Configuring computer
echo .........

#Extract username
username=$(cat /tmp/userlist | tr 'A-Z' 'a-z')
groups=$(cat /tmp/grouplist | tr 'A-Z' 'a-z')
echo Creating users
echo ........
sleep 5
for user in $username
do
        sudo useradd $user
	echo User: $user Created
done

echo Creating Groups
echo .........
sleep 5
for group in $groups
do
	sudo groupadd $group
	echo Group: $group Created
done

echo Assigning groups
echo ...........
sleep 5
for user in $username
do
	if [[$user == "admin"]]
	then
		sudo usermod -g admin $user
	elif [[$user == "badactor"]]
	then
		sudo usermod -g stayout $user]]
	elif [[$user == "tech"]]
	then
		sudo usermod -g worker $user
	elif [[$user == "george"]]
	then
		sudo usermod -g worker $user
	else 
		sudo usermod -g guest $user
	fi
done

echo Creating Files
echo ..........
sleep 5

touch /home/admin/secret.txt
touch /home/goerge/tasks
touch /home/badactor/endtheworld.sh
touch /home/tech/everything.txt
echo All the passwords > /home/admin/secret.txt
echo Enter time sheet \n grab lunch \n deliver package \n clock out > /home/george/tasks
echo "#!/bin/bash \n shutdown --poweroff" > /home/badactor/endtheworld.sh
echo all information on the network > /home/tech/everything.txt
echo ........
sleep 5
chmod 777 /home/admin/secret.txt
chmod 662 /home/george/tasks
chmod 722 /home/badactor/endtheworld.sh
chmod 777 /home/tech/everything.txt

echo computer built!
