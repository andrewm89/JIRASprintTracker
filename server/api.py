from flask import render_template

from server import app

from server.models import *

@app.route('/')
def index():
    return render_template('index.html')
