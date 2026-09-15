import os

from banking.bank import Bank
from banking.utils import transaction_session
from banking.exceptions import BankingError

from analysis.transaction_analysis import TransactionAnalyzer


def setup_sample_data(bank):
    """Create sample customers and accounts."""

    # Add customers.
    bank.add_customer(
        "C001",
        "Shrusti",
        "shrusti@example.com",
        "Bengaluru"
    )

    bank.add_customer(
        "C002",
        "Ananya",
        "ananya@example.com",
        "Mysuru"
    )

    bank.add_customer(
        "C003",
        "Rahul",
        "rahul@example.com",
        "Mangaluru"
    )

    # Create accounts.
    bank.create_savings_account(
        "A1001",
        "C001",
        10000
    )

    bank.create_current_account(
        "A1002",
        "C002",
        5000
    )

    bank.create_savings_account(
        "A1003",
        "C003",
        8000
    )


def perform_sample_transactions(bank):
    """Perform sample banking operations."""

    print("\n========== SAMPLE TRANSACTIONS ==========")

    with transaction_session():

        # Deposit into A1001.
        bank.deposit("A1001", 5000)

        # Withdraw from A1001.
        bank.withdraw("A1001", 2000)

        # Deposit into A1002.
        bank.deposit("A1002", 10000)

        # Withdraw from A1002.
        bank.withdraw("A1002", 1500)

        # Deposit into A1003.
        bank.deposit("A1003", 4000)

        # Transfer from A1001 to A1002.
        bank.transfer("A1001", "A1002", 3000)

        # Transfer from A1002 to A1003.
        bank.transfer("A1002", "A1003", 2500)


def display_customer_summary(bank):
    """Display customer balances."""

    print("\n========== CUSTOMER SUMMARY ==========")

    for customer in bank.customers.values():

        print(f"\nCustomer: {customer.name}")
        print(f"Customer ID: {customer.customer_id}")
        print(f"City: {customer.city}")

        print("Accounts:")

        for account in customer.accounts:
            print(
                f"  {account.account_number} | "
                f"₹{account.balance:.2f}"
            )

        print(
            f"Total balance: "
            f"₹{customer.get_total_balance():.2f}"
        )


def display_transaction_history(bank):
    """Display all transaction history."""

    print("\n========== TRANSACTION HISTORY ==========")

    for account in bank.accounts.values():

        print(f"\nAccount: {account.account_number}")

        for transaction in account.transactions:
            print(transaction)


def main():
    """Main function."""

    os.makedirs("data", exist_ok=True)
    os.makedirs("reports", exist_ok=True)

    bank = Bank("Simple Python Bank")

    try:
        setup_sample_data(bank)

        perform_sample_transactions(bank)

        display_customer_summary(bank)

        display_transaction_history(bank)

        # Export CSV files.
        bank.export_transactions(
            "data/transaction_history.csv"
        )

        bank.export_customers(
            "data/customers.csv"
        )

        print("\nCSV files exported successfully.")

        # Run Pandas and NumPy analysis.
        analyzer = TransactionAnalyzer(
            "data/transaction_history.csv",
            "data/customers.csv"
        )

        analyzer.run_analysis()

        analyzer.save_report(
            "reports/analysis_report.txt"
        )

    except BankingError as error:
        print(f"\nBanking error: {error}")

    except ValueError as error:
        print(f"\nValue error: {error}")

    print("\nProject execution completed.")


if __name__ == "__main__":
    main()