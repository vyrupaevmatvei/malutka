from fastapi import FastAPI

app = FastAPI()

@app.get("/status")
def get_status():
    return {"status": "OK", "message": "Server is running"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)