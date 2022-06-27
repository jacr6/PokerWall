import asyncio
import simple_websocket
ws = simple_websocket.Client('ws://localhost:5000/echo')


async def receive():
    try:
        data = ws.receive()
        print(f'< {data}')            
    except (KeyboardInterrupt, EOFError, simple_websocket.ConnectionClosed):
        ws.close()

async def send():
    while True:
        data = input('> ')
        ws.send(data)
        await receive()



async def main():
    await send()
    await asyncio.Future()  # run forever
    while True:
        await receive()
asyncio.run(main())