# Library Management System

A complete database system and CRUD API for managing library operations.

## Project Description

This project consists of two parts:
1. A complete MySQL database for library management (books, authors, publishers, borrowing)
2. A FastAPI-based CRUD API to interact with the database

## Features

- Track books, authors and publishers
- Manage borrowing records
- Full CRUD operations via API
- Proper database relationships and constraints

## How to Set Up

### Database Setup

1. Ensure MySQL is installed and running
2. Execute the SQL script:
   
   mysql -u [username] -p < question1/library.sql

### API Setup
1.Install Python 3.7+

2.Install dependencies:

 pip install fastapi uvicorn mysql-connector-python pydantic
3.Run the API:

 python question2/book_management_api.py
