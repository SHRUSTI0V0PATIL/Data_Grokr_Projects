from functools import wraps


def log_action(func):
    """Log the start and completion of a banking operation."""

    @wraps(func)
    def wrapper(*args, **kwargs):
        print(f"[LOG] Starting {func.__name__}")

        result = func(*args, **kwargs)

        print(f"[LOG] Completed {func.__name__}")
        return result

    return wrapper