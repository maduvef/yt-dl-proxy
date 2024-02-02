import pytest
import requests

test_url = "https://download.samplelib.com/mp3/sample-3s.mp3" # TODO find better test url


def test_system():
    assert requests.get("http://localhost:8080/get_url?url=test").status_code == requests.codes.internal_server_error
    assert requests.get(f'http://localhost:8080/get_url?url={test_url}').url == test_url


