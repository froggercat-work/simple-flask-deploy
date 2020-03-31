from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "<h1>Deployed!</h1>"

@app.route("/psqltest")
def psqltest():
    return "NOT IMPLEMENTED"

if __name__ == "__main__":
    app.run()