import urllib2, json

from flask import render_template, request, jsonify, Response

from server import app
from server.models import *
from server.core import mongo


@app.route('/staffing/sprints', methods=['GET'])
def get_sprints():
    try:
        sprints = []
        for sprint in mongo.db.sprints.find({}, {'_id':0}):
            sprints.append(sprint)

        resp = jsonify(sprints)
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
