import sys

sys.path.append("src")

from etl import fetch_data, transform_data


def test_fetch_data():
    data = fetch_data()

    assert isinstance(data, list)
    assert len(data) > 0


def test_transform_data():
    data = fetch_data()

    df = transform_data(data)

    assert "id" in df.columns
    assert "name" in df.columns
    assert "username" in df.columns
    assert "email" in df.columns


def test_no_missing_values():
    data = fetch_data()

    df = transform_data(data)

    assert df.isnull().sum().sum() == 0


def test_name_is_uppercase():
    data = fetch_data()

    df = transform_data(data)

    assert df["name"].str.isupper().all()