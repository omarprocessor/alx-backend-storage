#!/usr/bin/env python3

"""This module contains a function to list all documents in a MongoDB collection."""

def list_all(mongo_collection):
    """
    List all documents in a given MongoDB collection.
    
    Args:
        mongo_collection: The pymongo collection object.

    Returns:
        list: A list of all documents in the collection, or an empty list if no documents are found.
    """
    return list(mongo_collection.find())
