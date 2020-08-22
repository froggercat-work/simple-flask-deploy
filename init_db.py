import pandas as pd
from sqlalchemy import create_engine

pd.read_csv("actors.csv").to_sql(name="actors", con=create_engine("sqlite:///my_db.sqlite"))