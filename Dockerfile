from python:3.15.0a3-alpine@sha256:c7fcf93b725e5e2e9c506f1c20630e3617907cf9e68236a6873d2954a05bd9c1

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
