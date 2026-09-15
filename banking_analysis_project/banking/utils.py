from contextlib import contextmanager
from datetime import datetime


@contextmanager
def transaction_session():
    """Manage the beginning and end of a transaction session."""

    print("\nOpening transaction session...")

    try:
        yield
    finally:
        print("Closing transaction session...\n")


def get_current_date():
    """Return the current date as a string."""

    return datetime.now().strftime("%Y-%m-%d")


def validate_amount(amount):
    """Validate that an amount is a positive number."""

    if not isinstance(amount, (int, float)):
        raise ValueError("Amount must be a number.")

    if amount <= 0:
        raise ValueError("Amount must be greater than zero.")