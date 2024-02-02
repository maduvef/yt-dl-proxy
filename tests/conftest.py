import docker
import time

container = None

def pytest_sessionstart(session):
    print("setting up")
    image_name = "yt-dl-proxy:test"
    client = docker.from_env()
    client.images.build(path=".",tag=image_name)
    global container
    container = client.containers.run(image_name, ports={8080:8080}, detach=True, auto_remove=True)
    while "Serving" not in str(container.logs()):
        time.sleep(1)

def pytest_sessionfinish(session, exitstatus):
    print(f"cleaning up container {container.name}")
    container.stop()
