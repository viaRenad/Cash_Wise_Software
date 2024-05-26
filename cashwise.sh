#!/bin/bash

function welcome_screen() 
{
    clear
    echo "======================================================================="
    echo "                        Welcome to Cash Wise                           "
    echo ""
    echo "      The ultimate tool for smarter saving and seamless spending       "
    echo "======================================================================="
    echo ""
    while (true)
    do
        echo "1. Login"
        echo "2. Create an Account"
        echo "3. Exit"
        echo ""
        read -p "Enter Your Choice: " choice
        echo ""
        
    if [ "$choice" == "1" ]; then
        login
    elif [ "$choice" == "2" ]; then
        create_account
    elif [ "$choice" == "3" ]; then
        exit
    else
        echo "Invalid Option, Please Try Again"
        echo ""
    fi
    done
}

function create_account() 
{
    read -p "Enter First Name: " first_name
    read -p "Enter Last Name: " last_name

    while (true)
    do
        read -p "Enter Your G-mail: " gmail
        
        gmail_pattern="^[a-zA-Z0-9._%+-]+@gmail\.com$"
        
        if [[ "$gmail" =~ $gmail_pattern ]]; then
            break
        else
            echo ""
            echo "Invalid G-mail Address, Please Try Again"
            echo ""
        fi
    done

    while (true)
    do
        read -p "Set a Password of at Least 8 Characters: " password
        
        if [ ${#password} -ge 8 ]; then
            break
        else
            echo ""
            echo "Password Too Short, Please Try Again"
            echo ""
        fi
    done

    while (true)
    do
        read -p "Create a Username: " username
        
        if grep "^$username:" users.txt >/dev/null; then
            echo ""
            echo "Username Already Taken, Please Choose a Different Username"
            echo ""
        else
            break
        fi
    done

    echo "$username:$password:$first_name:$last_name:$gmail" >> users.txt
    echo ""
    echo "Account Created Successfully!"
    echo ""
    welcome_screen
}

function login() 
{
    echo -n "Enter your username: "
    read username
    echo -n "Enter your password: "
    read password
    echo ""
    
    if grep "^$username:$password:" users.txt >/dev/null; then
        echo "Login successful!"
        show_menu "$username"
    else
        echo "Invalid username or password."
        echo ""
        echo "Try again? Press (1) for Yes and Press any other Key for No"
        echo ""
        read -p "Enter your choice: " choice
        echo ""
        if [ "$choice" == "1" ]; then
            login
        else
            welcome_screen
        fi
    fi
}
function expense_tracking() 
{
    username=$1
    echo "1. View Expenses"
    echo "2. Add New Expense"
    echo "3. Search Expense History"
    echo "4. Back to Menu"
    echo ""
    read -p "Enter Your Choice: " choice
    echo ""

    case $choice in
        1) view_expenses "$username";;
        2) add_expense "$username";;
        3) search_expense_history "$username";;
        4) show_menu "$username";;
        *) echo "Invalid Option, Please Try Again"; echo ""; expense_tracking "$username";;
    esac
}

function view_expenses()
{
    username=$1
    echo "Expenses for $username:"
    echo ""
    grep "^$username:" expenses.txt | cut -d':' -f2-  
    echo ""
    expense_tracking "$username"
}

function add_expense() 
{
    username=$1
    read -p "Enter Expense Name: " expense_name
    read -p "Enter Amount: " amount
    read -p "Enter Category: " category
    read -p "Enter Payment Method: " payment_method

    echo "$username:$expense_name:$amount:$category:$payment_method" >> expenses.txt
    echo ""
    echo "Expense Added Successfully!"
    echo ""
    expense_tracking "$username"
}

function search_expense_history() 
{
    username=$1
    read -p "Enter Search Keyword: " keyword
    echo ""
    echo "Search Results for '$keyword' for $username:"
    echo ""
    grep -i "^$username:.*$keyword" expenses.txt  
    echo ""
    expense_tracking "$username"
}

function expense_tracking() 
{
    username=$1
    echo "1. View Expenses"
    echo "2. Add New Expense"
    echo "3. Search Expense History"
    echo "4. Back to Menu"
    echo ""
    read -p "Enter Your Choice: " choice
    echo ""

    case $choice in
        1) view_expenses "$username";;
        2) add_expense "$username";;
        3) search_expense_history "$username";;
        4) show_menu "$username";;
        *) echo "Invalid Option, Please Try Again"; echo ""; expense_tracking "$username";;
    esac
}

function view_expenses()
{
    username=$1
    echo "Expenses for $username:"
    echo ""
    grep "^$username:" expenses.txt | cut -d':' -f2-  
    echo ""
    expense_tracking "$username"
}

function add_expense() 
{
    username=$1
    read -p "Enter Expense Name: " expense_name
    read -p "Enter Amount: " amount
    read -p "Enter Category: " category
    read -p "Enter Payment Method: " payment_method

    echo "$username:$expense_name:$amount:$category:$payment_method" >> expenses.txt
    echo ""
    echo "Expense Added Successfully!"
    echo ""
    expense_tracking "$username"
}

function search_expense_history() 
{
    username=$1
    read -p "Enter Search Keyword: " keyword
    echo ""
    echo "Search Results for '$keyword' for $username:"
    echo ""
    grep -i "^$username:.*$keyword" expenses.txt  
    echo ""
    expense_tracking "$username"
}
function expense_tracking() 
{
    username=$1
    echo "1. View Expenses"
    echo "2. Add New Expense"
    echo "3. Search Expense History"
    echo "4. Back to Menu"
    echo ""
    read -p "Enter Your Choice: " choice
    echo ""

    case $choice in
        1) view_expenses "$username";;
        2) add_expense "$username";;
        3) search_expense_history "$username";;
        4) show_menu "$username";;
        *) echo "Invalid Option, Please Try Again"; echo ""; expense_tracking "$username";;
    esac
}

function view_expenses()
{
    username=$1
    echo "Expenses for $username:"
    echo ""
    grep "^$username:" expenses.txt | cut -d':' -f2-  
    echo ""
    expense_tracking "$username"
}

function add_expense() 
{
    username=$1
    read -p "Enter Expense Name: " expense_name
    read -p "Enter Amount: " amount
    read -p "Enter Category: " category
    read -p "Enter Payment Method: " payment_method

    echo "$username:$expense_name:$amount:$category:$payment_method" >> expenses.txt
    echo ""
    echo "Expense Added Successfully!"
    echo ""
    expense_tracking "$username"
}

function search_expense_history() 
{
    username=$1
    read -p "Enter Search Keyword: " keyword
    echo ""
    echo "Search Results for '$keyword' for $username:"
    echo ""
    grep -i "^$username:.*$keyword" expenses.txt  
    echo ""
    expense_tracking "$username"
}function budget_management()
{
    username=$1
    echo "1. View Budgets"
    echo "2. Add New Budget"
    echo "3. Search Budget History"
    echo "4. Back to Menu"
    echo ""
    read -p "Enter Your Choice: " choice
    echo ""

    case $choice in
        1) view_budgets "$username";;
        2) add_budget "$username";;
        3) search_budget_history "$username";;
        4) show_menu "$username";;
        *) echo "Invalid Option, Please Try Again"; echo ""; budget_management "$username";;
    esac
}

function view_budgets()
{
    username=$1
    echo "Budgets for $username:"
    echo ""
    grep "^$username:" budgets.txt | cut -d':' -f2-
    echo ""
    budget_management "$username"
}

function add_budget()
{
    username=$1

    if (( available_funds == 0 )); then
        read -p "Enter the amount of funds available: " available_funds
    fi

    read -p "Enter Budget Name: " budget_name
    read -p "Enter Amount for $budget_name: " budget_amount

    if (( available_funds == 0 || budget_amount > available_funds )); then
        echo "Current Balance $available_funds Does Not Cover The $budget_amount Budget"
        echo ""
        echo "Press (1) to Add Extra Money and Press any Key to Go Back to Menu"
        read -p "Choose an option: " option

        case $option in
            1) add_extra_money "$username" "$budget_name" "$budget_amount";;
            *) echo ""; budget_management "$username";;
        esac
    else
        available_funds=$(( available_funds - budget_amount ))
        echo "$username:$budget_name:$budget_amount" >> budgets.txt
        echo ""
        echo "Budget Added Successfully!"
        echo ""
        budget_management "$username"
    fi
}

function add_extra_money()
{
    username=$1
    budget_name=$2
    budget_amount=$3

    read -p "Enter The Amount for The Extra Funds: " extra_amount

    available_funds=$(( available_funds + extra_amount ))
    echo ""
    echo "Additional funds added successfully!"
    echo ""
    add_budget "$username"
}

function search_budget_history()
{
    username=$1
    read -p "Enter Search Keyword: " keyword
    echo ""
    echo "Search Results for '$keyword' for $username:"
    echo ""
    grep -i "^$username:.*$keyword" budgets.txt 
    echo ""
    budget_management "$username"
}
function debt_management()
{
    username=$1
    echo "1. View Debts"
    echo "2. Add New Debt"
    echo "3. Search Debt History"
    echo "4. Back to Menu"
    echo ""
    read -p "Enter Your Choice: " choice
    echo ""

    case $choice in
        1) view_debts "$username";;
        2) add_debt "$username";;
        3) search_debt_history "$username";;
        4) show_menu "$username";;
        *) echo "Invalid Option, Please Try Again"; echo ""; debt_management "$username";;
    esac
}

function view_debts()
{
    username=$1
    echo "Debts for $username:"
    echo ""
    grep "^$username:" debts.txt | cut -d':' -f2-
    echo ""
    debt_management "$username"
}

function add_debt()
{
    username=$1
    read -p "Enter Debt Name: " debt_name
    read -p "Enter Amount: " amount
    read -p "Enter Creditor: " creditor
    read -p "Enter Due Date: " due_date

    echo "$username:$debt_name:$amount:$creditor:$due_date" >> debts.txt
    echo ""
    echo "Debt Added Successfully!"
    echo ""
    debt_management "$username"
}

function search_debt_history()
{
    username=$1
    read -p "Enter Search Keyword: " keyword
    echo ""
    echo "Search Results for '$keyword' for $username:"
    echo ""
    grep -i "^$username:.*$keyword" debts.txt | cut -d':' -f2- 
    echo ""
    debt_management "$username"
}
function debt_management()
{
    username=$1
    echo "1. View Debts"
    echo "2. Add New Debt"
    echo "3. Search Debt History"
    echo "4. Back to Menu"
    echo ""
    read -p "Enter Your Choice: " choice
    echo ""

    case $choice in
        1) view_debts "$username";;
        2) add_debt "$username";;
        3) search_debt_history "$username";;
        4) show_menu "$username";;
        *) echo "Invalid Option, Please Try Again"; echo ""; debt_management "$username";;
    esac
}

function view_debts()
{
    username=$1
    echo "Debts for $username:"
    echo ""
    grep "^$username:" debts.txt | cut -d':' -f2-
    echo ""
    debt_management "$username"
}

function add_debt()
{
    username=$1
    read -p "Enter Debt Name: " debt_name
    read -p "Enter Amount: " amount
    read -p "Enter Creditor: " creditor
    read -p "Enter Due Date: " due_date

    echo "$username:$debt_name:$amount:$creditor:$due_date" >> debts.txt
    echo ""
    echo "Debt Added Successfully!"
    echo ""
    debt_management "$username"
}

function search_debt_history()
{
    username=$1
    read -p "Enter Search Keyword: " keyword
    echo ""
    echo "Search Results for '$keyword' for $username:"
    echo ""
    grep -i "^$username:.*$keyword" debts.txt | cut -d':' -f2- 
    echo ""
    debt_management "$username"
}

function show_menu()
{
    username=$1
    echo ""
    echo "======================================================================="
    echo "                            Services Menu                              "
    echo "======================================================================="
    echo ""
    echo "1. Expense Tracking"
    echo "2. Budget Management"
    echo "3. Debt Management"
    echo "4. Logout (back to welcome screen)"
    echo ""
    read -p "Choose an option: " op

    case $op in
    "1")
        echo ""
        echo "======================================================================="
        echo "                          Expense Tracking                             "
        echo "======================================================================="
        echo ""
        expense_tracking "$username";;
    "2")
        echo ""
        echo "======================================================================="
        echo "                          Budget Management                            "
        echo "======================================================================="
        echo ""
        budget_management "$username";;
    "3")
        echo ""
        echo "======================================================================="
        echo "                          Debt Management                              "
        echo "======================================================================="
        echo ""
        debt_management "$username";;
    "4") welcome_screen ;;
    *)
        echo ""
        echo "Invalid Option, Please Try Again"
        echo ""
        ;;
    esac
    show_menu "$username"
}

welcome_screen
