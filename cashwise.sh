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
}