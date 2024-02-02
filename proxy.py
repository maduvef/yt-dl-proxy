from flask import Flask, redirect, request, abort
from time import time
from os import environ
import yt_dlp

app = Flask(__name__)

url_cache = {}

default_format = environ.get('DL_FORMAT', 'best')
cache_timeout_seconds = int(environ.get('DL_CACHE_TIMEOUT_SECONDS', "120"))

@app.route("/get_url")
def get_url():
    in_url = request.args["url"]
    if "cover." in in_url:
        abort(404)
    cached_url = url_cache.get(in_url, (0,""))
    if cached_url[0] >= time() - cache_timeout_seconds:
        print("using cached url")
        return redirect(cached_url[1])
    format=request.args.get("format", default_format)
    ydl_opts = { 'format': format }
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        info = ydl.extract_info(in_url, download=False)
        out_url = info["url"]
        url_cache[in_url] = (info["epoch"], out_url)
        print(info["protocol"])
        return redirect(out_url)

