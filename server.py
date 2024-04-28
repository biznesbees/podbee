from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI()


@app.get("/")
async def hello():
    message = {"message": "Thank you for using PodBee!"}
    return JSONResponse(content=message, status_code=200)
