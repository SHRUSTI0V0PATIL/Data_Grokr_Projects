import requests
import pandas as pd
import os


API_URL = "https://jsonplaceholder.typicode.com/users"


def fetch_data():
    response = requests.get(API_URL)

    if response.status_code != 200:
        raise Exception("Failed to fetch data")

    return response.json()


def transform_data(data):
    df = pd.DataFrame(data)

    # Select required columns
    df = df[["id", "name", "username", "email"]]

    # Remove missing values
    df = df.dropna()

    # Standardize text
    df["name"] = df["name"].str.upper()
    df["email"] = df["email"].str.lower()

    return df


def save_data(df):
    os.makedirs("data", exist_ok=True)

    file_path = "data/users_cleaned.csv"

    df.to_csv(file_path, index=False)

    return file_path


def run_etl():
    print("Starting ETL pipeline...")

    # Extract
    print("1. Fetching data...")
    data = fetch_data()

    # Transform
    print("2. Transforming data...")
    df = transform_data(data)

    # Load
    print("3. Saving data...")
    file_path = save_data(df)

    print("ETL completed successfully!")
    print(f"Output file: {file_path}")

    return df


if __name__ == "__main__":
    run_etl()