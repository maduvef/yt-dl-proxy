from python:3.15.0a6-alpine@sha256:1f3d508838ef876fb62070f2080d469c234c6db03b7beeae5c84f6c8c810e664

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
