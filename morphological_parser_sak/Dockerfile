#FROM python:3.7-slim
FROM python:3.7-alpine
WORKDIR /server
COPY ./src .
RUN pip install -r requirements.txt
RUN pip install .
WORKDIR ./morphological_parser

CMD [ "python", "./api.py" ]
