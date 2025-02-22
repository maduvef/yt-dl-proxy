from python:3.13-alpine@sha256:323a717dc4a010fee21e3f1aac738ee10bb485de4e7593ce242b36ee48d6b352

COPY ./proxy.py ./requirements.txt /yt-dl-proxy/
WORKDIR /yt-dl-proxy

RUN pip install -r requirements.txt && \
    rm requirements.txt && \
    adduser -DH proxy

USER proxy

CMD ["waitress-serve", "--host", "0.0.0.0", "proxy:app"]
