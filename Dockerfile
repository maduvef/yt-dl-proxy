from python:3.13-alpine@sha256:657dbdb20479a6523b46c06114c8fec7db448232f956a429d3cc0606d30c1b59

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
