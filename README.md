# README
Prerequisites to run this web application in localhost 
1. rails db:migrate RAILS_ENV=development
2. rake db:reset
3. rails s

* Ruby version
  - Ruby 2.3.0
  - Rails 5.0.3
  
* System dependencies
  - Linux or Mac environment recommended to run
  
* Gem installed
    gem 'sqlite3'
    - sqlite3 for testing database environment
    gem 'rspec-rails', '~> 3.0'
    gem 'shoulda'
    gem 'factory_girl_rails', '~> 4.0'
    - factory_girl, shoulda and rspec-rails for TDD (Test Driven Development)
 
    gem "pg"
    - PostgresSQL for staging database

    gem 'faker'
    - For creating fake data
    gem 'will_paginate', '~> 3.1.0'
    - For paging
  
* Database Setup
  - rake db:reset on terminal

* Database initialization
  - rake db:seed on terminal


