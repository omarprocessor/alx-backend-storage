#!/usr/bin/env python3

"""This module contains a function to insert a new school document into a MongoDB collection."""

def insert_school(mongo_collection, **kwargs):
    """
    Insert a new document into a MongoDB collection based on keyword arguments.
    
    Args:
        mongo_collection: The pymongo collection object.
        **kwargs: The fields of the new document.

    Returns:
        ObjectId: The _id of the newly inserted document.
    """
    result = mongo_collection.insert_one(kwargs)
    return result.inserted_id
