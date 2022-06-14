#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

exec uwsgi --ini /app/wsgi.ini --die-on-term
