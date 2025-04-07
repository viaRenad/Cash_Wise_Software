# Cash Wise
Cash Wise is a **Bash script application** for managing personal finances through a command-line interface. 

## The tool enables users to:
- **Manage User Accounts:** Create and log in to individual accounts with validated email addresses and secure password requirements.
- **Track Expenses:** Record, view, and search expenses with details such as amount, category, and payment method.
- **Manage Budgets and Debts:** View, add, and search budget entries and debt records, facilitating ongoing financial monitoring and planning.
- **Data Persistence:** Store user, expense, budget, and debt data in local text files for easy retrieval and modification.

## How It Works
The application presents users with a welcome screen offering options for login or account creation. Upon successful login, users are guided through various financial management services using menu-driven prompts. Each feature is implemented through dedicated shell functions that handle data input, validation, and file operations.

## Running the Application
To start the application, ensure that you have execution permissions and that the required data files (users.txt, expenses.txt, budgets.txt, and debts.txt) exist in the same directory. 

Then, run the script using:
```bash cash_wise.sh```
