from fastapi import FastAPI
from controllers import default_controller

app = FastAPI()

app.include_router(default_controller.router)