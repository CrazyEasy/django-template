#!/usr/bin/env bash

python manage.py collectstatic --no-input
python manage.py makemigrations # add django applications
python manage.py migrate
python manage.py shell < docker/startup_automation.py
gunicorn -b 0.0.0.0:8000 core.wsgi
