dbusr = "postgres"
dbpwd = "YOUR DB PASSWORD HERE"
dbhost = "localhost"
dbengine = "postgresql"
db = "test"
cxnstring = (os.environ["DATABASE_URL"] if os.getenv("DATABASE_URL")
    else f"{dbengine}://{dbusr}:{dbpwd}@{dbhost}/{db}")
