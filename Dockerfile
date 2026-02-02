from python:3.15.0a5-alpine@sha256:998bc0bdc3da726d5e4446e8e1497c64020a7c2de6b849170de375af5fac87c6

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
