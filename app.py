from flask import Flask, Response
import pandas as pd
from sqlalchemy import create_engine
from config import dbusr, dbpwd

app = Flask(__name__)

engine = create_engine(f"postgresql://{dbusr}:{dbpwd}@localhost/test")

@app.route("/")
def index():
    return "<h1>Deployed!</h1>"

@app.route("/psqltest")
def psqltest():
    return Response(pd.read_sql("SELECT * FROM actor LIMIT 10", engine).to_json(orient="records"), mimetype="application/json")

if __name__ == "__main__":
    app.run()