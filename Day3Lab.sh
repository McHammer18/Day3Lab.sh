#!/bin/bash
echo Configuring computer
echo .........

#Extract username
username=$(cat /tmp/userlist | tr 'A-Z' 'a-z')
groups=$(cat /tmp/grouplist | tr 'A-Z' 'a-z')
echo Creating users
echo ........
for user in $username
do
        sudo useradd $user
	echo User: $user Created
done

echo Creating Groups
echo .........

for group in $groups
do
	sudo groupadd $group
	echo Group: $group Created
done

echo Assigning groups
echo ...........

for user in $username
do
	if [$user == 'admin']
	then
		sudo usermod -g admin $user
	elif [$user == 'badactor']
	then
		sudo usermod -g stayout $user
	elif [$user == 'tech']
	then
		sudo usermod -g worker $user
	elif [$user == 'george']
	then
		sudo usermod -g worker $user
	else 
		sudo usermod -g guest $user
	fi
done

