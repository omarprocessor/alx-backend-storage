#!/usr/bin/env python3
"""
Find schools by topic
"""


def schools_by_topic(mongo_collection, topic):
    """
    Return a list of schools with a specific topic.

    :param mongo_collection: pymongo collection object
    :param topic: topic to search for (string)
    :return: list of matching school documents
    """
    return mongo_collection.find({"topics": topic})
