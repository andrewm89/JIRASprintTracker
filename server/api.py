import urllib2, json

from flask import render_template, request, jsonify

from server import app

from server.models import *

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


@app.route('/users', methods=['GET'])
def users():
    req = urllib2.Request("https://tindtechnologies.atlassian.net/rest/api/2/groupuserpicker?query=tind")
    req.add_header("Content-Type","application/json")
    cookies = request.cookies
    if "cloud.session.token" in cookies:
        req.add_header("Cookie", "cloud.session.token=%s" % cookies["cloud.session.token"])
    response = urllib2.urlopen(req)

    return response.read()
