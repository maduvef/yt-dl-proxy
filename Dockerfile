from python:3.15.0b1-alpine@sha256:8fe37a98f64ee15fee985b1536cc005aef67847c31f435772250165307a68c2e

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
