# 0x01. NoSQL

## Description

This project introduces the fundamental concepts and operations of NoSQL databases, focusing on MongoDB. Through a series of tasks, we explore the basics of NoSQL architecture, advantages, data operations, and how to use MongoDB both through the shell and Python with PyMongo.

---

## Learning Objectives

By the end of this project, you should be able to explain the following without external resources:

- What NoSQL means
- Differences between SQL and NoSQL
- What ACID means in database systems
- What document storage is
- Different types of NoSQL databases
- Advantages of NoSQL databases
- How to query, insert, update, and delete information in a NoSQL database
- How to use MongoDB

---

## Requirements

### General
- Ubuntu 18.04 LTS
- MongoDB version: 4.2
- Python3 version: 3.7
- PyMongo version: 3.10

### MongoDB Scripts
- All files should end with a new line
- First line of all files: `// my comment`
- Script output should be testable using `wc`

### Python Scripts
- First line: `#!/usr/bin/env python3`
- Code must conform to `pycodestyle` (2.5.\*)
- Files must be executable and not execute when imported
- Each module and function must be documented
- Use `if __name__ == "__main__":` to prevent code from running on import

---

## Resources

- [NoSQL Databases Explained](https://www.mongodb.com/nosql-explained)
- [What is NoSQL?](https://www.geeksforgeeks.org/sql-vs-nosql/)
- [MongoDB with Python Crash Course](https://www.youtube.com/watch?v=E-1xI85Zog8)
- [MongoDB Tutorial 2: Insert, Update, Remove, Query](https://www.youtube.com/watch?v=CB9G1i_t5oI)
- [Aggregation](https://docs.mongodb.com/manual/aggregation/)
- [Introduction to MongoDB and Python](https://realpython.com/introduction-to-mongodb-and-python/)
- [mongo Shell Methods](https://docs.mongodb.com/manual/reference/method/)
- [Mongosh](https://www.mongodb.com/docs/mongodb-shell/)

---

## Installation Notes

To install MongoDB 4.2:

```bash
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo mkdir -p /data/db
sudo service mongod start
