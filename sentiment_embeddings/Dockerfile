FROM python:3.7-slim
WORKDIR /server

COPY ./src .
RUN apt-get update
RUN apt-get -y install --no-install-recommends git
RUN apt-get -y install libc-dev
RUN apt-get -y install build-essential
RUN pip install -U pip
RUN pip install -U pip
RUN pip install -r requirements.txt --no-deps
CMD [ "python", "./api.py" ]
