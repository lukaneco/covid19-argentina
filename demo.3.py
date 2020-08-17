import os
import time
from flask import Flask, jsonify
from threading import Thread
from tasks import threaded_task

app = Flask(__name__)
app.secret_key = os.urandom(42)


@app.route("/", defaults={'duration': 5})
@app.route("/<int:duration>")
def index(duration):
    thread = Thread(target=threaded_task, args=(duration,))
    thread.daemon = True
    thread.start()
    return jsonify({'thread_name': str(thread.name),
                    'started': True})


app.run(debug=True, use_reloader=True)