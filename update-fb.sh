#!/bin/sh
#wget https://graph.facebook.com/me/friends?access_token=...
indent -bap friends ; grep -Pe '^"name' friends | tr -d '}' | sed 's/"name": "//g' | grep -Poe '^[a-z A-Z]+' >  names
cat names | zenity --list --column="NAMES"

smile=""
laugh=""
sad=""
cry=""
surprise=""
tongue=""
wink=""
default=""
picture="/home/kln/.mcabber/pictures/facebook/"

while true;
do
	ans=$(zenity --list\
		--title="Select Pictures"\
		--column="Faces" --editable --column="Path"\
		"Smile :)" "$smile"\
		"Laugh :D" "$laugh"\
		"Sad :(" "$sad"\
		"Crying :'(" "$cry"\
		"Surprise :O" "$surprise"\
		"Tongue out :P" "$tongue"\
		"Wink ;)" "$wink");
	if [ "$ans" == "" ]
	then
		id=$(cat friends | grep -Pe "$name" | cut -d '"' -f8);
		wget https://graph.facebook.com/$id/picture
		mkdir -p $picture$id

		mv picture $picture$id/
		
		if [ "$smile" == "" ]
		then
			cp $picture$id/picture $picture$id/OikK
		else
			cp $smile $picture$id/OikK
		fi

		if [ "$laugh" == "" ]
		then
			cp $picture$id/picture $picture$id/OkQK
		else
			cp $laugh $picture$id/OkQK
		fi
		
		if [ "$sad" == "" ]
		then
			cp $picture$id/picture $picture$id/OigK
		else
			cp $sad $picture$id/OigK
		fi

		if [ "$cry" == "" ]
		then
			cp $picture$id/picture $picture$id/OicoCg==
		else
			cp $cry $picture$id/OicoCg==
		fi

		if [ "$surprise" == "" ]
		then
			cp $picture$id/picture $picture$id/Ok8K
		else
			cp $surprise $picture$id/Ok8K
		fi

		if [ "$tongue" == "" ]
		then
			cp $picture$id/picture $picture$id/OlAK
		else
			cp $tongue $picture$id/OlAK
		fi

		if [ "$wink" == "" ]
		then
			cp $picture$id/picture $picture$id/OykK
		else
			cp $wink $picture$id/OykK
		fi
		break;
	fi

	file=$(zenity --file-selection --title="Select a File");
	
	case $ans in  
		"Smile :)")
			smile=$file;;
		"Laugh :D")
			laugh=$file;;
		"Sad :(")
			sad=$file;;
		"Crying :'(")
			cry=$file;;
		"Surprise :O")
			surprise=$file;;
		"Tongue out :P")
			tongue=$file;;
		"Wink ;)")
			wink=$file;;
	esac
done;

