#!/usr/bin/env python

import asyncio
import websockets
from websockets import serve
import json


CLIENTS = set()
MESAGES = []


async def echo(websocket):
    async for message in websocket:
        MESAGES.append(message)
        if MESAGES.length > 10:
            MESAGES = MESAGES[-10:]
        websockets.broadcast(CLIENTS, message)


async def handler(websocket):
    if(CLIENTS.contains(websocket)):
        websocket.send("\n".join(MESAGES))
    CLIENTS.add(websocket)
    await echo(websocket)


async def main(server, port):
    async with serve(handler, server, port):
        await asyncio.Future()  # run forever


def start():
    config = ""
    with open('assets/data/config.json') as config_file:
        config = json.load(config_file)
    server = config["server"] or "localhost"
    port = config["port"] or 5000
    print(f"Listen on {server}:{port}")
    asyncio.run(main(server, port))


if __name__ == "__main__":
    start()
