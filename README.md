# README

In order to run this in localhost, enter rake db:reset first before entering rails s on command line

* Ruby version
- ruby 2.3.0p0
- Rails 5.0.3\
* System dependencies
  group :development do
    gem 'sqlite3'
  end
  - sqlite3 for testing database
  group :development, :test do
    gem 'rspec-rails', '~> 3.0'
    gem 'shoulda'
    gem 'factory_girl_rails', '~> 4.0'
  end
  - factory_girl and rspec-rails for TDD
  
  group :production, :staging do
    gem "pg"
  end
  - PostgresSQL for staging database

  gem 'rails-controller-testing'
  gem 'faker'
  - For creating fake data
  gem 'will_paginate', '~> 3.1.0'
  - For paging
  
* Configuration
  

* Database creation
  rake db:reset

* Database initialization
  rake db:seed on terminal

* Services (job queues, cache servers, search engines, etc.)


