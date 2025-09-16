from flask import Flask
from redis import Redis

app = Flask(__name__)
# Note: The app expects to find a Redis server at the hostname 'redis'
redis = Redis(host='redis', port=6379)

@app.route('/')
def hello():
    count = redis.incr('hits')
    return f'Hello from Docker! This page has been visited {count} times.'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)