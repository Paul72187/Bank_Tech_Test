# BANK TECH TEST

# CRITERIA AND SCOPE
A customer creates a bank account on 10/01/2023\
To enable a deposit of £1,000.00

The customer accesses this bank account on 13/01/2023\
To deposit a further sum of £2,000.00\
The bank balance is now £3,000.00

The customer accesses this bank account on 14/01/2023\
To withdraw a sum of £500.00\
The bank balance is now £2,500.00

# INSTALLATION
Ruby Version 3.0.2\
Dependencies installed via bundle install

# TESTING
Rspec used to test unit and feature tests in all files

# TEST COVERAGE
SimpleCov runs via index.html and provides 100% coverage

# INTERACTIVE PROGRAM
This program can be run interactively using irb\
Commands in terminal:\
Step 1: irb\
Step 2: require './lib/bank_account.rb'\
Step 3: my_account = BankAccount.new

# PROGRAM FUNCTIONALITY
This Ruby program enables the user to:
1. Deposit sums of money (with amounts specified to two decimal places)
2. Withdraw sums of money (with amounts specified to two decimal places)
3. Print a statement with the current account balance (including amounts and dates of transactions)
