# base image
FROM python:3.9.0

WORKDIR /home/

RUN echo "무야호"
RUN echo "testing"

# 장고 소스코드를 이미지 안에 넣는 것
RUN git clone https://github.com/YOON9661/pinterest_clone.git

WORKDIR /home/pinterest_clone/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN echo "SECRET_KEY=oz0ew4m(m=j$@_@t3xjgv4gr58bgx9-!^+p%n_z%!^8m@rgv09" > .env

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --settings=pinterest_prj.settings.deploy && gunicorn pinterest_prj.wsgi --env DJANGO_SETTINGS_MODULE=pinterest_prj.settings.deploy --bind 0.0.0.0:8000"]