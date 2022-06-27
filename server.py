#!/usr/bin/env python

import asyncio
import websockets
from websockets import serve

CLIENTS = set() 


async def echo(websocket):
    async for message in websocket:
        websockets.broadcast(CLIENTS, message)

async def handler(websocket):
    CLIENTS.add(websocket)
    await echo(websocket)
    

async def main():
    async with serve(handler, "localhost", 5000):
        await asyncio.Future()  # run forever

asyncio.run(main())
