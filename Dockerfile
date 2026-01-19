from python:3.15.0a5-alpine@sha256:30b1268a2ce612d15c4d03b61eb26bb7ae5f9e7cd79a021aa3600a9c1b7fa20d

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
