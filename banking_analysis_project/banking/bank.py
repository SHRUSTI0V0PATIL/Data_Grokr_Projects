import pandas as pd

from banking.account import SavingsAccount, CurrentAccount
from banking.customer import Customer
from banking.decorators import log_action
from banking.exceptions import (
    AccountNotFoundError,
    CustomerNotFoundError,
    DuplicateAccountError,
    DuplicateCustomerError
)


class Bank:
    """Manage customers, accounts, and banking operations."""

    def __init__(self, name):
        self.name = name
        self.customers = {}
        self.accounts = {}

    def add_customer(self, customer_id, name, email, city):
        """Create and add a new customer."""

        if customer_id in self.customers:
            raise DuplicateCustomerError(
                "Customer ID already exists."
            )

        customer = Customer(
            customer_id,
            name,
            email,
            city
        )

        self.customers[customer_id] = customer

        return customer

    def find_customer(self, customer_id):
        """Find a customer by ID."""

        if customer_id not in self.customers:
            raise CustomerNotFoundError(
                "Customer not found."
            )

        return self.customers[customer_id]

    def create_savings_account(
        self,
        account_number,
        customer_id,
        initial_deposit
    ):
        """Create a savings account."""

        return self._create_account(
            account_number,
            customer_id,
            initial_deposit,
            "savings"
        )

    def create_current_account(
        self,
        account_number,
        customer_id,
        initial_deposit
    ):
        """Create a current account."""

        return self._create_account(
            account_number,
            customer_id,
            initial_deposit,
            "current"
        )

    def _create_account(
        self,
        account_number,
        customer_id,
        initial_deposit,
        account_type
    ):
        """Internal method to create an account."""

        if account_number in self.accounts:
            raise DuplicateAccountError(
                "Account number already exists."
            )

        customer = self.find_customer(customer_id)

        if account_type == "savings":
            account = SavingsAccount(
                account_number,
                customer_id,
                initial_deposit
            )
        else:
            account = CurrentAccount(
                account_number,
                customer_id,
                initial_deposit
            )

        self.accounts[account_number] = account
        customer.add_account(account)

        return account

    def find_account(self, account_number):
        """Find an account by account number."""

        if account_number not in self.accounts:
            raise AccountNotFoundError(
                "Account not found."
            )

        return self.accounts[account_number]

    @log_action
    def deposit(self, account_number, amount):
        """Deposit money into an account."""

        account = self.find_account(account_number)

        return account.deposit(amount)

    @log_action
    def withdraw(self, account_number, amount):
        """Withdraw money from an account."""

        account = self.find_account(account_number)

        return account.withdraw(amount)

    @log_action
    def transfer(self, sender_number, receiver_number, amount):
        """Transfer money from one account to another."""

        sender = self.find_account(sender_number)
        receiver = self.find_account(receiver_number)

        # Withdraw from sender.
        sender.withdraw(amount)

        # Deposit into receiver.
        receiver.deposit(amount)

        # Rename the last two transaction types.
        sender.transactions[-1].transaction_type = "Transfer Out"
        receiver.transactions[-1].transaction_type = "Transfer In"

        return True

    def get_all_transactions(self):
        """Collect transactions from all accounts."""

        all_transactions = []

        for account in self.accounts.values():
            for transaction in account.transactions:
                all_transactions.append(transaction.to_dict())

        return all_transactions

    def export_transactions(self, file_path):
        """Export all transactions to a CSV file."""

        transactions = self.get_all_transactions()

        df = pd.DataFrame(transactions)

        df.to_csv(file_path, index=False)

        return df

    def export_customers(self, file_path):
        """Export customer details to a CSV file."""

        customers = [
            {
                "customer_id": customer.customer_id,
                "name": customer.name,
                "email": customer.email,
                "city": customer.city
            }
            for customer in self.customers.values()
        ]

        df = pd.DataFrame(customers)

        df.to_csv(file_path, index=False)

        return df

    def display_accounts(self):
        """Display all accounts."""

        for account in self.accounts.values():
            print(account)

    def display_customers(self):
        """Display all customers."""

        for customer in self.customers.values():
            print(customer)