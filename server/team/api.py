import urllib2, json

from flask import render_template, request, jsonify, Response

from server import app
from server.models import *
from server.core import mongo


@app.route('/users', methods=['GET'])
def users():
    req = urllib2.Request("https://tindtechnologies.atlassian.net/rest/api/2/groupuserpicker?query=tind")
    req.add_header("Content-Type","application/json")
    cookies = request.cookies
    if "cloud.session.token" in cookies:
        req.add_header("Cookie", "cloud.session.token=%s" % cookies["cloud.session.token"])
    response = urllib2.urlopen(req)

    return response.read()


@app.route('/team/members', methods=['GET'])
def get_team_members():
    try:
        members = []
        for member in mongo.db.team_members.find({}, {'_id':0}):
            members.append(member)

        resp = jsonify(members)
        resp.status_code = 200
        return resp
    except:
        return Response(status=400)


@app.route('/team/members/add', methods=['POST'])
def add_team_member():
    try:
        mongo.db.team_members.insert(json.loads(request.data))
        return Response(status=204)
    except:
        return Response(status=400)


@app.route('/team/members/remove', methods=['DELETE'])
def remove_team_member():
    try:
        mongo.db.team_members.remove(json.loads(request.data))
        return Response(status=204)
    except:
        return Response(status=400)
