from flask import Flask, Response, render_template
import pandas as pd
from sqlalchemy import create_engine
from config import cxnstring

app = Flask(__name__)

engine = create_engine(cxnstring, pool_recycle=3600)

@app.route("/")
def index():
    return "<h1>Deployed!</h1>"

@app.route("/sqltest")
def psqltest():
    response = pd.read_sql("SELECT * FROM actors LIMIT 10", engine)
    return Response(response.to_json(orient="records", date_format="iso"), mimetype="application/json")

@app.route("/simple_home")
def home():
    return render_template("index.html")

if __name__ == "__main__":
    app.run()