#!/bin/bash

# Creating django project

#a) linux users may need: sudo chown -R $USER:$USER .


function set_up_django {
  echo 'Bootstrapping backend...'
  sudo docker-compose run backend django-admin.py startproject $PROJNAME .
}


# Reset container processes

function bounce_server {
  docker-compose down && docker-compose up
}

# TODO: figure out interpolation

function dispatch_migrations {
  docker exec dockerblr_backend_1 python manage.py makemigrations && docker exec dockerblr_backend_1 python manage.py migrate
}

function startapp-backend {
  docker exec dockerblr_backend_1 python manage.py startapp api
}

function create-super-user {
  docker exec dockerblr_backend_1 python manage.py createsuperuser
}



START=""
PROJNAME=""
MIGRATE=""

while :
do
	case $1 in
		-s|--setup)
      if [ -z "$2" ]
      then
        echo "Init: please provide a project name for django directory"
        exit
      fi
      START=$1
      PROJNAME=$2
      shift
      shift
			break
			;;
    -m)
      # if [ -z "$2" ]
      # then
      #   echo "Provide the name used to create your top level directory"
      #   exit
      # fi
      echo "Make migrations and migrate"
      MIGRATE=$2
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

if [ ! -z "$MIGRATE" ]
  then
    dispatch_migrations
fi
