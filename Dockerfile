from python:3.15.0a8-alpine@sha256:b2d3bdf6ed31c7b77e564b0c21a0a7d32a2da31bded6e14b2a0947a675f869bd

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
