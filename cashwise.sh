#!/bin/bash
# Function That Acts as The Welcome Screen
function welcome_screen()
{
    # Display The Welcome Message + Software's Slogan
    clear
    echo "======================================================================="
    echo "                        Welcome to Cash Wise                           "
    echo ""
    echo "      The ultimate tool for smarter saving and seamless spending       "
    echo "======================================================================="
    echo ""
    # Options for Loging In or Creating an Account
    echo -n "Enter Your Choice: "
    read choice
    if [ "$choice" == "1" ]; then
        login
    elif [ "$choice" == "2" ]; then
        create_account
    else
        echo ""
        echo "Invalid Choice, Please Try Again"
        echo ""
        welcome_screen
    fi
}

# Funtion to Create an Account
function create_account()
{
    read -p "Enter First Name: " first_name
    read -p "Enter Last Name: " last_name

    while true; do
        read -p "Enter Email: " email
        if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]; then
            break
        else
            echo "Invalid Email Adress, Please Try Again"
        fi
    done

    while true; do
        read -p "Set a Password of at Least 8 Ccharacters: " password
        if [ ${#password} -ge 8 ]; then
            break
        else
            echo "Password Too Short, Please Try Again"
        fi
    done

    while true; do
        read -p "Create a Username: " username
        if grep -q "^$username:" users.txt; then
            echo "Username Already Taken, Please Choose a Different Username"
        else
            break
        fi
    done

    echo "$username:$password:$first_name:$last_name:$email" >>users.txt
    echo "Account Created Successfully!"
    echo ""
    welcome_screen
}
# Function To Handle User Log In Process
function login()
{
    # Check username and password from the users.txt file
    echo -n "Enter your username: "
    read username
    echo -n "Enter your password: "
    read password
    if grep -q "^$username:$password:" users.txt; then
        echo "Login successful!"
        show_menu
    else
        echo "Invalid username or password."
        echo ""
        echo "1. Try again"
        echo "2. Go back to the welcome screen"
        read -p "Enter your choice: " retry_option
        if [ "$retry_option" == "1" ]; then
            login
        elif [ "$retry_option" == "2" ]; then
            welcome_screen
        else
            echo "Invalid option. Please try again."
            login
        fi
    fi
}
