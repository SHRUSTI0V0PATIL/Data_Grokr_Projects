class Transaction:
    def __init__(
        self,
        transaction_id,
        account_number,
        customer_id,
        transaction_type,
        amount,
        balance_after,
        date
    ):
        self.transaction_id = transaction_id
        self.account_number = account_number
        self.customer_id = customer_id
        self.transaction_type = transaction_type
        self.amount = amount
        self.balance_after = balance_after
        self.date = date

    def to_dict(self):
        """Convert the transaction object into a dictionary."""

        return {
            "transaction_id": self.transaction_id,
            "account_number": self.account_number,
            "customer_id": self.customer_id,
            "transaction_type": self.transaction_type,
            "amount": self.amount,
            "balance_after": self.balance_after,
            "date": self.date
        }

    def __str__(self):
        return (
            f"{self.transaction_id} | "
            f"{self.transaction_type} | "
            f"₹{self.amount:.2f} | "
            f"Balance: ₹{self.balance_after:.2f} | "
            f"{self.date}"
        )