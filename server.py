#!/usr/bin/env python

import asyncio
import websockets
from websockets import serve
import json


CLIENTS = set()


async def echo(websocket):
    async for message in websocket:
        websockets.broadcast(CLIENTS, message)


async def handler(websocket):
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
