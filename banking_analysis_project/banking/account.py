from banking.transactions import Transaction
from banking.decorators import log_action
from banking.exceptions import (
    InsufficientBalanceError,
    InvalidAmountError
)
from banking.utils import get_current_date


class Account:
    """Base class for all bank accounts."""

    def __init__(self, account_number, customer_id, balance=0):
        self.account_number = account_number
        self.customer_id = customer_id
        self.balance = balance
        self.transactions = []

    def add_transaction(self, transaction):
        """Add a transaction to the account history."""

        self.transactions.append(transaction)

    def create_transaction(self, transaction_type, amount):
        """Create and store a transaction."""

        transaction_id = f"T{len(self.transactions) + 1:03d}"

        transaction = Transaction(
            transaction_id=transaction_id,
            account_number=self.account_number,
            customer_id=self.customer_id,
            transaction_type=transaction_type,
            amount=amount,
            balance_after=self.balance,
            date=get_current_date()
        )

        self.add_transaction(transaction)

    @log_action
    def deposit(self, amount):
        """Deposit money into the account."""

        if amount <= 0:
            raise InvalidAmountError(
                "Deposit amount must be greater than zero."
            )

        self.balance += amount

        self.create_transaction("Deposit", amount)

        return self.balance

    @log_action
    def withdraw(self, amount):
        """Withdraw money from the account."""

        if amount <= 0:
            raise InvalidAmountError(
                "Withdrawal amount must be greater than zero."
            )

        if amount > self.balance:
            raise InsufficientBalanceError(
                "Insufficient balance."
            )

        self.balance -= amount

        self.create_transaction("Withdrawal", amount)

        return self.balance

    def get_balance(self):
        """Return the current balance."""

        return self.balance

    def get_transaction_history(self):
        """Return all transactions."""

        return self.transactions

    def __str__(self):
        return (
            f"Account: {self.account_number} | "
            f"Balance: ₹{self.balance:.2f}"
        )


class SavingsAccount(Account):
    """Savings account with a minimum balance requirement."""

    MINIMUM_BALANCE = 500

    def withdraw(self, amount):
        """Withdraw money while maintaining the minimum balance."""

        if amount <= 0:
            raise InvalidAmountError(
                "Withdrawal amount must be greater than zero."
            )

        if self.balance - amount < self.MINIMUM_BALANCE:
            raise InsufficientBalanceError(
                f"Savings account must maintain at least "
                f"₹{self.MINIMUM_BALANCE}."
            )

        self.balance -= amount

        self.create_transaction("Withdrawal", amount)

        return self.balance


class CurrentAccount(Account):
    """Current account with an overdraft limit."""

    OVERDRAFT_LIMIT = 2000

    def withdraw(self, amount):
        """Withdraw money using the overdraft facility if needed."""

        if amount <= 0:
            raise InvalidAmountError(
                "Withdrawal amount must be greater than zero."
            )

        if amount > self.balance + self.OVERDRAFT_LIMIT:
            raise InsufficientBalanceError(
                "Withdrawal exceeds the overdraft limit."
            )

        self.balance -= amount

        self.create_transaction("Withdrawal", amount)

        return self.balance