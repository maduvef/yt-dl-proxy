from python:alpine

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
