import pandas as pd
from sqlalchemy import create_engine
from config import cxnstring

pd.read_csv("actors.csv").to_sql(name="actors", con=create_engine(cxnstring), index=False)