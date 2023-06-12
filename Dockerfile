FROM python:3

WORKDIR /usr/src

ADD requirements.txt /usr/src
RUN pip3 install -r requirements.txt

ADD . /usr/src

RUN python3 run.py --test
RUN rm -rf ./data/pending
