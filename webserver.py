import os
import random
import subprocess
import multiprocessing


def webserver(port):
    os.system(f"python -m http.server --directory ./build/web {port}")


def chrome(port):
    os.system(f"chromium http://localhost:{port}/#/Wall")


def main(port):
    process1 = multiprocessing.Process(target=webserver, args=(port,))
    process2 = multiprocessing.Process(target=chrome, args=(port,))
    process1.start()
    process2.start()


if __name__ == "__main__":
    try:
        port = random.randint(9000, 9999)
        main(port)

    except Exception as e:
        print(e)
