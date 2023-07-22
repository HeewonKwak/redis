from fastapi import FastAPI
import uvicorn

# FastAPI 객체 생성
app = FastAPI()

import redis

r = redis.Redis(host='127.0.0.1', port=6379, db=0)

r.set('foo', 'bar')

# "/"로 접근하면 return을 보여줌
@app.get("/")
def read_root():
    return {"Hello": r.get('foo')}


if __name__ == '__main__':
    uvicorn.run(app, host="0.0.0.0", port=8000)