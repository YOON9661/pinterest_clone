# base image
FROM python:3.9.0

WORKDIR /home/

# 장고 소스코드를 이미지 안에 넣는 것
RUN git clone https://github.com/YOON9661/pinterest_clone.git

WORKDIR /home/pinterest_clone/

RUN pip install -r requirements.txt

RUN echo "SECRET_KEY=oz0ew4m(m=j$@_@t3xjgv4gr58bgx9-!^+p%n_z%!^8m@rgv09" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runservere", "0.0.0.0:8000"]