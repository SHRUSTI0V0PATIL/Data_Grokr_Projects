class BankingError(Exception):
    """Base exception for banking-related errors."""
    pass


class InsufficientBalanceError(BankingError):
    """Raised when an account does not have enough balance."""
    pass


class InvalidAmountError(BankingError):
    """Raised when an amount is zero, negative, or invalid."""
    pass


class AccountNotFoundError(BankingError):
    """Raised when an account cannot be found."""
    pass


class CustomerNotFoundError(BankingError):
    """Raised when a customer cannot be found."""
    pass


class DuplicateAccountError(BankingError):
    """Raised when an account number already exists."""
    pass


class DuplicateCustomerError(BankingError):
    """Raised when a customer ID already exists."""
    pass