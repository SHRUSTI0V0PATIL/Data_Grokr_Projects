class Customer:
    """Represent a bank customer."""

    def __init__(self, customer_id, name, email, city):
        self.customer_id = customer_id
        self.name = name
        self.email = email
        self.city = city
        self.accounts = []

    def add_account(self, account):
        """Add an account to the customer."""

        self.accounts.append(account)

    def get_accounts(self):
        """Return all accounts belonging to the customer."""

        return self.accounts

    def get_total_balance(self):
        """Calculate the total balance across all accounts."""

        return sum(
            account.balance
            for account in self.accounts
        )

    def __str__(self):
        return (
            f"{self.customer_id} | "
            f"{self.name} | "
            f"{self.email} | "
            f"{self.city}"
        )