#!/usr/bin/env python3

"""This module contains a function to update the topics of a school document."""

def update_topics(mongo_collection, name, topics):
    """
    Update the topics for a school document based on the school name.
    
    Args:
        mongo_collection: The pymongo collection object.
        name (str): The name of the school to update.
        topics (list): A list of strings representing the topics to set.
    """
    mongo_collection.update_one(
        {"name": name},  # Find the document by school name
        {"$set": {"topics": topics}}  # Set the new topics list
    )
