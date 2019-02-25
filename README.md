# README

This project was done as course project for Applied Computing Project course. It has user management and saves files to AWS S3.

* System dependencies

        Ruby version : 2.5.0
        Rails version : 5.1.4
        Brew
        MySQL

* Process

1. Clone UserFileManagement repo.
2. Give your mysql(either root or user) username password in config/database.yml file.
3. Open Terminal or Shell.
4. Navigate to root folder and run

        $ mysql.server start
        $ bundle install
        $ rake db:create
        $ rake db:migrate
        $ rails server
