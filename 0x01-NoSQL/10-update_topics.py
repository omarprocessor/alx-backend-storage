#!/usr/bin/env python3
"""
Update topics for a school document by name
"""


def update_topics(mongo_collection, name, topics):
    """
    Update all topics of a school document matching the given name.

    :param mongo_collection: pymongo collection object
    :param name: name of the school (string)
    :param topics: list of new topics (list of strings)
    """
    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
