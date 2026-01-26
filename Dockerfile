from python:3.15.0a5-alpine@sha256:f77a9303949324561403f4be60dca95b3c7e42f7e5510e78aa5564da3104d6e2

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
