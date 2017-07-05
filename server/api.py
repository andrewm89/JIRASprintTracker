import urllib2, json

from flask import render_template, request, jsonify, Response

from server import app
from server.models import *
from server.core import mongo

from team import api


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/login', methods=['POST'])
def login():
    data = json.dumps(request.data).encode('utf8')
    req = urllib2.Request("https://tindtechnologies.atlassian.net/rest/auth/latest/session")
    req.add_header("Content-Type","application/json")
    response = urllib2.urlopen(req, request.data)

    return response.read()


@app.route('/logout', methods=['DELETE'])
def logout():

    req = urllib2.Request("https://tindtechnologies.atlassian.net/rest/auth/latest/session")
    req.get_method = lambda: 'DELETE'
    req.add_header("Content-Type","application/json")
    cookies = request.cookies
    if "cloud.session.token" in cookies:
        req.add_header("Cookie", "cloud.session.token=%s" % cookies["cloud.session.token"])
    response = urllib2.urlopen(req)

    return response.read()
