# Simple Flask Deploy

Depending on what you came here for, you may not need _all_ the files in this repo. Check out the section(s) you need. If you were in one of my classes, you likely also have a demo video I recorded for you, showing how to use this repo to deploy to Heroku.

## Heroku Deployment

These deploy files to not include adding Postgres to your Heroku App, btw - you have to do that by hand.

There's a bunch of ways to do this, but one easy way is on the Heroku dashboard - login and add a Heroku Postgres instance to your app's resources.

Don't forget to add your data to your remote database! You can follow the instructions in the "Database Set Up" section if you're looking for some quick and dirty set up (just note that you'll have to add foreign and primary keys).

```
simple-flask-deploy/
├── static/
│   ├── js/
│   │   ├── index.js
├── templates/
│   ├── index.html
├── app.py
├── config.py
├── Procfile
├── requirements.txt
└── runtime.txt
```

## Database Set Up

You must run the database set up manually by adding your db credentials to `config.py` and then running `python init_db.py` if you would like to use a remote db or new sqlite file.

```
simple-flask-deploy/
├── init_db.py
├── actors.csv
└── config.py
```

## Small Flask App Using Its Own Endpoints to Read From A Database

There is zero styling in any of the HTML, and the code is intentionally terse in app.py. 

The goal is to show how all the pieces fit together!

_`my_db.sqlite` is optional. If you prefer to use a real database, set up your credentials in `config.py`._

```
simple-flask-deploy/
├── static/
│   ├── js/
│   │   ├── index.js
├── templates/
│   ├── index.html
├── app.py
├── my_db.sqlite
└── config.py
```