from fastapi import FastAPI

app = FastAPI()

@app.get("/status")
def get_status():
    return {"Hello World!"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)