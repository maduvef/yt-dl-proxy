from python:3.15.0a5-alpine@sha256:e961120e292af1c08b9b45c3dd289d2fe09bb04515ba17a1be6ae86b9ea6e713

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
