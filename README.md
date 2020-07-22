# Nginx proxy image specifically for Django

This is built upon the default `nginx` image and is meant strictly for applications using django and gunicorn. Frequently changed values can be customized
using environment variables

### NGINX_PORT = 8000

Runs the nginx proxy on port 8000

### APP_HOST = localhost

Runs the django application on localhost or 127.0.0.1

### APP_PORT = 9000

Runs the gunicorn server on port 9000

### SERVER_NAME

The domain name or your application (`example.com`, `xyz.example.com`)
