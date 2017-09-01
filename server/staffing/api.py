import urllib2, json

from flask import render_template, request, jsonify, Response

from server import app
from server.models import *
from server.core import mongo

@app.route('/staffing/boards', methods=['GET'])
def get_boards():
    req = urllib2.Request("https://tindtechnologies.atlassian.net/rest/agile/1.0/board?type=scrum")
    req.add_header("Content-Type","application/json")
    cookies = request.cookies
    if "cloud.session.token" in cookies:
        req.add_header("Cookie", "cloud.session.token=%s" % cookies["cloud.session.token"])
    response = urllib2.urlopen(req)

    return response.read()

@app.route('/staffing/sprints/<board_id>', methods=['GET'])
def get_sprints(board_id):
    req = urllib2.Request("https://tindtechnologies.atlassian.net/rest/agile/1.0/board/{board_id}/sprint?maxResults=100&startAt=50".format(board_id=board_id))
    req.add_header("Content-Type","application/json")
    cookies = request.cookies
    if "cloud.session.token" in cookies:
        req.add_header("Cookie", "cloud.session.token=%s" % cookies["cloud.session.token"])
    response = urllib2.urlopen(req)

    return response.read()

@app.route('/staffing/sprints/db/<path:name>', methods=['GET'])
def get_sprint_from_db(name):
    try:
        for sprint in mongo.db.sprints.find({"name": name}, {'_id':0}):
            resp = jsonify(sprint)
            resp.status_code = 200
            return resp

        resp = jsonify([])
        resp.status_code = 200
        return resp
    except:
        return Response(status=400)

@app.route('/staffing/sprints/new', methods=['POST'])
def new_sprint():
    try:
        mongo.db.sprints.insert(json.loads(request.data))
        return Response(status=204)
    except:
        return Response(status=400)

@app.route('/staffing/sprints', methods=['PUT'])
def update_sprints():
    try:
        sprint = request.get_json()
        mongo.db.sprints.update_one({"name": sprint["name"]}, {"$set":sprint})
        return Response(status=204)
    except:
        return Response(status=400)
