FROM tiangolo/uwsgi-nginx-flask:python3.6-alpine3.7

RUN apk --update add bash nano
COPY . /var/www/

ENV STATIC_URL /static
ENV STATIC_PATH /var/www/app/static

COPY ./requirements.txt /var/www/requirements.txt

RUN pip install -r /var/www/requirements.txt

RUN nc localhost < /dev/null; echo $?
RUN bash script.sh

EXPOSE 5000