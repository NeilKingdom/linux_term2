#!/bin/bash
#Neil Kingdom
#040967309
#20W_CST8102 Section 300
#April 1, 2020
#This script creates a user interface for user and group management
while [ true ]; do
	echo -en "Choose one of the following options:\nA to Create a user account\nB to Delete a user account\nC to Change supplementary group for a user account\nD to Change initial group for a user account\nE to Change default login shell for a user account\nF to Change account expiration date for a user account\nQ to quit\nWhat would you like to do?: "; read userIn
	if [ $userIn == A ] || [ $userIn == a ]; then
		echo -en "\nPlease enter the username of the new user: "; read userName
		echo -n "Enter user's home directory (absolute path): "; read homeDir
		echo -n "Enter the default login shell (absolute path): "; read shell
		sudo useradd -d $homeDir -s $shell -m $userName
		#using case, we will test the last instance of the exit status (last command ran) to decide what the resulting output should be
		case $? in
			0)	
				sleep 3 && clear
				echo -e "The user $userName was created successfully!\n"
				;;
			*)
				sleep 3 && clear 
				echo -e "An error occured. The command was unable to finish\n"
				;;
		esac
	elif [ $userIn == B ] || [ $userIn == b ]; then
		echo -en "\nEnter the user you would like to delete: "; read userName
		sudo userdel -r $userName
		case $? in
			0)
				sleep 3 && clear
				echo -e "The user $userName was deleted along with their home directory\n"
				;;
			*)
				sleep 3 && clear
				echo -e "An error occured. The command was unable to finish\n"
		esac
	elif [ $userIn == C ] || [ $userIn == c ]; then
		echo -en "\nEnter the username of the user you wish to have added in another supplementary group: "; read userName
		echo -n "Enter the supplementary group you would like $userName to be a part of: "; read suppGroup
		sudo usermod -a -G $suppGroup $userName
		case $? in
			0)
				sleep 3 && clear
				echo -e "$userName is now part of $suppGroup!\n"
				;;
			*)
				sleep 3 && clear
				echo -e "An error occured. The command was unable to finish\n"
		esac
	elif [ $userIn == D ] || [ $userIn == d ]; then
		echo -en "\nEnter the username of the user you wish to change primary groups for: "; read userName
		echo -n "Enter the name of the group you'd like to have as your primary group: "; read primGroup
		sudo usermod -g $primGroup $userName	
		case $? in
			0)
				sleep 3 && clear
				echo -e "Primary group was successfully changed to $primGroup!\n"
				;;
			*)
				sleep 3 && clear
				echo -e "An error occured. The command was unable to finish\n"
		esac
	elif [ $userIn == E ] || [ $userIn == e ]; then
		echo -en "\nEnter the user whos default shell you wish to change: "; read userName
		echo -n "Enter the directory (absolute path) of the shell: "; read shell
		#compgen is a command to retrieve usernames for all users
		sudo grep $shell /etc/shells && compgen -u & grep $userName
		case $? in
			0)
				sleep 3 && clear
				echo -e "Default shell for $userName is now set to $shell\n" 
				;;
			*)
				sleep 3 && clear
				echo -e "An error occured. The command was unable to finish\n"
			esac
	elif [ $userIn == F ] || [ $userIn == f ]; then
		echo -en "\nEnter user whos expiration date you wish to edit: "; read userName
		echo -n "Enter the expiry date youd like to use (YYYY-MM-DD): "; read expDate 
		sudo usermod -e $expDate $userName
		case $? in
			0)
				sleep 3 && clear
				echo -e "Expiration date for $userName has been set to $expDate\n"
				;;
			*)
				sleep 3 && clear
				echo -e "An error occured. The command was unable to finish\n"
		esac
	elif [ $userIn == Q ] || [ $userIn == q ]; then
		exit	
	else
	      	sleep 3 && clear	
		echo -e "Sorry, but that was not a valid input\n"
	fi
done
