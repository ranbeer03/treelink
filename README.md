# README

TreeLink - Ruby on Rails Application

Welcome to TreeLink, a Ruby on Rails application that allows users to create and manage their own "tree" of links, similar to Linktree. This README will guide you through the setup, testing, and deployment process.

Table of Contents

Setup
Prerequisites
Installation
Testing
Deployment
Accessing the Deployed Application


Setup

Prerequisites
Before you begin, make sure you have the following prerequisites installed:

Ruby (version 2.6.0 or higher)
Ruby on Rails (version 6.0.0 or higher)
PostgreSQL (for the database)
Node.js and Yarn (for JavaScript dependencies)
Installation

Clone the Repository:
git clone https://github.com/yourusername/treelink.git
cd treelink

Install Dependencies:
bundle install
yarn install

Database Setup:
Create the database and run migrations:
rails db:create
rails db:migrate

Environment Variables:
Create a .env file in the project root and configure the following environment variables:
env
DATABASE_URL=postgresql://username:password@localhost/treelink
DEVISE_SECRET_KEY=your_secret_key
SECRET_KEY_BASE=your_secret_key_base
Replace username, password, your_secret_key, and your_secret_key_base with ranbeerchaudhary, 123456789, 8690409ad1552acef00ec5f418dfe8a0.

Start the Server:
rails server
Your TreeLink application should now be running locally at http://localhost:3000.


Testing

The application includes a comprehensive test suite for unit and integration testing.

Running Tests:
To run all tests, use the following command:
bundle exec rspec
This command will execute both RSpec unit tests and Capybara integration tests.

Test Purpose:
Unit tests in spec/models/ test the models (e.g., Tree and User) for validations and methods.
Integration tests in spec/features/ test the user interactions, including creating trees and editing accounts.
Controller tests in spec/controllers/ test the CRUD actions, authentication, and redirection logic.


Deployment

Deployment steps depend on your hosting platform. 

Database Configuration:
Configured the production database settings in config/database.yml.
Environment Variables:
Set the necessary environment variables for production in the hosting environment. These should match the variables defined in your .env file.
Precompile Assets:
In the production environment, precompile assets using:
RAILS_ENV=production rails assets:precompile
Migrate Database:
RAILS_ENV=production rails db:migrate
Start the Application Server:
Start your production application server (i.e., Passenger) with:
RAILS_ENV=production rails server
Configure Web Server (Nginx/Apache):
Set up the web server to proxy requests to the application server
Accessing the Deployed Application
The applicaitonis not acceisible currently due to issues faced with nginx while deploying on an ec2 instance.