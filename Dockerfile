FROM python:3

WORKDIR /usr/src

ADD requirements.txt /usr/src
RUN pip3 install -r requirements.txt

ADD . /usr/src

ARG PANOPTES_USERNAME
ARG PANOPTES_PASSWORD
ARG LASAIR_TOKEN

# add BUILD_DATE arg to invalidate the cache
ARG BUILD_DATE=''
# bake this into the image for reference
# and invalidate the docker image cache to rebuild each time (remote data source may change)
# https://docs.docker.com/engine/reference/builder/#impact-on-build-caching
ENV BUILD_DATE=$BUILD_DATE
RUN echo building at $BUILD_DATE

RUN python3 run.py
RUN rm -rf ./data/pending
