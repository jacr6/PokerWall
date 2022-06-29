import os
import random

port = random.randint(9000, 9999)

os.system(f"python -m http.server --directory build/web {port}")

