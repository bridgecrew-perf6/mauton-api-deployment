# mauton-api-deployment :tiger:

## Purpose
Describe the procedures of deployment to Heruko for mauton-api.

## Prerequisites 📋
You'll need:
* [postgresql](https://www.postgresql.org/) 
* [DBeaver](https://dbeaver.io/download/) (which is free and open source universal database tool )
* [Git](https://git-scm.com) 
* [NPM](http://npmjs.com)
* [Google reCAPTCHA v3](https://developers.google.com/recaptcha/docs/v3) (which you need to register for a key)
* [Heroku](https://heroku.com) (which is for the platform to launch your website)

## Deployment 📦

### Step 1 - Create Heroku Account

Create a account in Heroku

### Step 2 - Install Heroku CLI

please install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

### Step 3 - Create Heroku App using Heroku CLI

```bash
# create a Heroku App
$ heroku create $YOUR_API
# check git remote 
$ git remote -v
#you should see something like below
heroku  https://git.heroku.com/$YOUR_API.git (fetch)
heroku  https://git.heroku.com/$YOUR_API.git (push)
```

### Step 4 - Create a postgresql DB in Heroku
* Login Heroku
* Select Data > Select Postgresql > Install Heroku Postgres
* Choose App to provision to your Heroku API (after this, your DB will connect to your API)

### Step 5 - run script to add Table in your DB
* Login Heroku
* Select Data > get Credentials of Your Heroku Postgresql DB
* Connect your DB with the Credentials in DBeaver (you can connect your DB via different IDE or client)
* run the [SQL](https://github.com/ikhvjs/mauton-api-deployment/blob/main/mauton-api-sql.sql) in your DB

### Step 6 - Add your Environment Variable in Heroku Dashboard
* Login Heroku
* Select Dashboard > your API > Setting
* In Config Vars, Click 'Reveal Config Vars'
* Add 5 Environment Varaible 
```
  DATABASE_URL = 'Your DB connection string' (which should be set in step 4)
  CAPTCHA_KEY = 'Your Google reCAPTCHA v3 secret Key'
  NODE_ENV = 'prod'
  TOKEN_EXPIRY_TIME = 'your token time in seconds (you can put 2000 here)'
  TOKEN_KEY = 'it is up to you, better with at leaset 40 characters'
```

### Step 7 - Commit your changes to your App
```bash
# Go into your mauton-api clone repository
$ cd mauton-api
$ git add .
$ git commit -m "heroku setup"
# push your changes to Heroku
$ git push heroku master
```

### Step 8 - Finished!!! See your App
```bash
# See your app
$ heroku open
```

## Acknowledgments 🎁
[Heroku Nodejs Deployment](https://devcenter.heroku.com/articles/deploying-nodejs)
