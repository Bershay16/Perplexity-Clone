from fastapi import FastAPI

from pydantic_models.chat_body import ChatBody

app = FastAPI()

@app.post("/chat")
def chat_endpoints(body: ChatBody):
    print(body.query)
    return body.query