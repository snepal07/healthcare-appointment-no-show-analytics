import pandas as pd
from sqlalchemy import create_engine, URL

df = pd.read_csv("healthcare_cleaned.csv")

url = URL.create(
    drivername="mysql+pymysql",
    username="YOUR_USERNAME",
password="YOUR_PASSWORD",
    host="localhost",
    database="healthcare_analytics"
)

engine = create_engine(url)

df.to_sql(
    "appointments",
    engine,
    if_exists="replace",
    index=False
)

print("Upload successful!")