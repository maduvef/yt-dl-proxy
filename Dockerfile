from python:3.15.0a7-alpine@sha256:5a349e1c8f195fee97c4ad33d7357c5a8820a18a5d166b9f29487d3a54b203dc

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
