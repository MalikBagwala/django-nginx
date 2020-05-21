FROM nginx
LABEL maintiner="m.bagwala@outlook.com"

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl

ENV NGINX_PORT=8000
ENV APP_HOST=app
ENV APP_PORT=9000

RUN touch /etc/nginx/conf.d/default.conf

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000

ENTRYPOINT [ "./entrypoint.sh" ]