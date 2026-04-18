from flask import Flask, jsonify
import time

app = Flask(__name__)
start_time = time.time()

@app.route('/healthcheck', methods=['GET'])
def healthcheck():
    uptime = time.time() - start_time
    return jsonify({
        "uptime": uptime,
        "message": "OK",
        "timestamp": time.time()
    }), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)