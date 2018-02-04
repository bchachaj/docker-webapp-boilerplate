#!/bin/bash

#1.) Creating django project

function set_up_django {
  echo 'Bootstrapping backend...'
  sudo docker-compose run backend django-admin.py startproject $PROJNAME .
}

  #1.a) linux needs: sudo chown -R $USER:$USER .

#2.) need to then wire database to postgres backend

#3.) docker-compose up

#4) trying bmf to ready and create migrations


#) can remove with rm -rf django once docker down




START=""
PROJNAME=""

while :
do
	case $1 in
		-s|--setup)
      if [ -z "$2" ]
      then
        echo "init: please provide a project name"
        exit
      fi
      START=$1
      PROJNAME=$2
      shift
      shift
			break
			;;
		-*)
			echo Unrecognized option: $1
			echo
			help
			exit
			break
			;;
		*)
			break
			;;
	esac
done

if [ ! -z "$PROJNAME" ]
  then
    set_up_django
fi


# echo $START
# echo $PROJNAME
