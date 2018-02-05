## Read Me
Containerized Django, Postgres and (tbd) frontend application

-finish startup script and document

## Set up backend

`./manager.sh -s <project-name>`

## Database settings update

Replace default db settings with equivalent:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'db',
        'PORT': 5432,
    }
}
```
*Best practice*: get variables from .env file

## Set up frontend

WIP

## Note

You can execute Django's manage.py after initial build by prefacing with 'docker exec <container-name>'. For example `docker exec <container-name> python manage.py samplecommand`
