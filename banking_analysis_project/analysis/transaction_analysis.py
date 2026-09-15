import pandas as pd
import numpy as np


class TransactionAnalyzer:
    """Analyze banking transaction data using Pandas and NumPy."""

    def __init__(self, transaction_file, customer_file):
        self.transaction_file = transaction_file
        self.customer_file = customer_file

        self.transactions = None
        self.customers = None
        self.merged_data = None

    def load_data(self):
        """Read CSV files using Pandas."""

        self.transactions = pd.read_csv(
            self.transaction_file
        )

        self.customers = pd.read_csv(
            self.customer_file
        )

        print("\nCSV files loaded successfully.")

    def basic_information(self):
        """Display basic information about the data."""

        print("\n========== BASIC INFORMATION ==========")

        print("\nFirst 5 transactions:")
        print(self.transactions.head())

        print("\nNumber of rows and columns:")
        print(self.transactions.shape)

        print("\nColumn names:")
        print(list(self.transactions.columns))

        print("\nMissing values:")
        print(self.transactions.isnull().sum())

    def numpy_analysis(self):
        """Perform basic calculations using NumPy."""

        amounts = self.transactions["amount"].to_numpy()

        print("\n========== NUMPY ANALYSIS ==========")

        print("Total amount:", np.sum(amounts))
        print("Average amount:", np.mean(amounts))
        print("Maximum amount:", np.max(amounts))
        print("Minimum amount:", np.min(amounts))
        print("Standard deviation:", np.std(amounts))

    def groupby_analysis(self):
        """Analyze transactions using groupby."""

        print("\n========== GROUPBY ANALYSIS ==========")

        print("\nTotal amount by transaction type:")

        type_summary = (
            self.transactions
            .groupby("transaction_type")["amount"]
            .sum()
        )

        print(type_summary)

        print("\nTransaction count by type:")

        type_count = (
            self.transactions
            .groupby("transaction_type")["amount"]
            .count()
        )

        print(type_count)

        print("\nTotal amount by customer:")

        customer_summary = (
            self.transactions
            .groupby("customer_id")["amount"]
            .sum()
        )

        print(customer_summary)

    def merge_analysis(self):
        """Merge transaction data with customer data."""

        print("\n========== MERGE ANALYSIS ==========")

        self.merged_data = self.transactions.merge(
            self.customers,
            on="customer_id",
            how="left"
        )

        print(self.merged_data)

        print("\nCustomer-wise transaction summary:")

        summary = (
            self.merged_data
            .groupby(["customer_id", "name", "city"])["amount"]
            .sum()
            .reset_index()
        )

        print(summary)

    def functional_programming(self):
        """Demonstrate lambda, map, filter, and comprehensions."""

        print("\n========== FUNCTIONAL PROGRAMMING ==========")

        amounts = self.transactions["amount"].tolist()

        # List comprehension
        large_amounts = [
            amount
            for amount in amounts
            if amount > 5000
        ]

        print("\nList comprehension - amounts above ₹5,000:")
        print(large_amounts)

        # Dictionary comprehension
        transaction_map = {
            row["transaction_id"]: row["amount"]
            for _, row in self.transactions.iterrows()
        }

        print("\nDictionary comprehension - transaction amounts:")
        print(transaction_map)

        # Lambda + sorted
        sorted_amounts = sorted(
            amounts,
            key=lambda amount: amount,
            reverse=True
        )

        print("\nLambda - amounts sorted descending:")
        print(sorted_amounts)

        # Map
        rounded_amounts = list(
            map(lambda amount: round(amount, 2), amounts)
        )

        print("\nMap - rounded amounts:")
        print(rounded_amounts)

        # Filter
        filtered_amounts = list(
            filter(lambda amount: amount > 5000, amounts)
        )

        print("\nFilter - amounts above ₹5,000:")
        print(filtered_amounts)

    def save_report(self, file_path):
        """Save a summary report to a text file."""

        amounts = self.transactions["amount"].to_numpy()

        report = f"""
BANKING TRANSACTION ANALYSIS REPORT
===================================

Total transactions: {len(self.transactions)}
Total transaction amount: ₹{np.sum(amounts):.2f}
Average transaction amount: ₹{np.mean(amounts):.2f}
Maximum transaction amount: ₹{np.max(amounts):.2f}
Minimum transaction amount: ₹{np.min(amounts):.2f}
Standard deviation: ₹{np.std(amounts):.2f}

Transaction type summary:
{self.transactions.groupby("transaction_type")["amount"].sum().to_string()}
"""

        with open(file_path, "w", encoding="utf-8") as file:
            file.write(report)

        print(f"\nReport saved to {file_path}")

    def run_analysis(self):
        """Run all analysis methods."""

        self.load_data()
        self.basic_information()
        self.numpy_analysis()
        self.groupby_analysis()
        self.merge_analysis()
        self.functional_programming()