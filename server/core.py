from server import app

from flask_pymongo import PyMongo

mongo = PyMongo(app)
