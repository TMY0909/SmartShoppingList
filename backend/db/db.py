from sqlalchemy import create_engine
from sqlalchemy.engine import URL
from sqlalchemy.orm import sessionmaker
from dotenv import load_dotenv
import os
from contextlib import contextmanager

load_dotenv(dotenv_path="./core/.env")

url = URL.create(
    drivername = "postgresql",
    username = os.getenv("DB_USER"),
    password = os.getenv("DB_PASS"),
    host = "db",
    port = 5432,
    database = "SmartShoppingListDB"
)

engine = create_engine(url)
Session = sessionmaker(bind=engine)

def get_db():
    session = Session()
    try:
        yield session
    finally:
        session.close()

get_session = contextmanager(get_db)