import os
import json
from flask import Flask, request, Response
from flask import render_template, send_from_directory, url_for

app = Flask(__name__, static_folder='../static', template_folder="../static")

app.config.from_object('server.settings')

app.url_map.strict_slashes = False

import server.core
import server.models
import server.api
