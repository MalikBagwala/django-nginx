# first we declare our upstream server, which is our Gunicorn application
upstream gunicorn {
    server ${APP_HOST}:${APP_PORT};
}

# now we declare our main server
server {
    listen ${NGINX_PORT};
    server_name ${SERVER_NAME};

    location /static/ {
        alias /usr/src/app/static/;
    }

    location / {
        proxy_pass http://gunicorn;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_read_timeout 180s;
        proxy_redirect off;
        client_max_body_size 5M;
        if (!-f $request_filename) {
            proxy_pass http://gunicorn;
            break;
        }
    }
}