from python:3.15.0a2-alpine@sha256:afdc66993b1b4bae60a6728c1bc27ef501840bbb3fdf27068744e35d946f8af0

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
