#!/bin/bash

#login page
var=`curl -s --request GET 'https://caroc.duckdns.org/login/'`
if [ "$var" = "Login Page not yet implemented" ]; then
    printf "%s\t%s\n" "Login page" "success" 
else 
    printf "%s\t%s\n" "Login page" "error"
fi

#register page
var=`curl -s --request GET 'https://caroc.duckdns.org/register/'`
if [ "$var" = "Register Page not yet implemented" ]; then
    printf "%s\t%s\n" "Register page" "success" 
else 
    printf "%s\t%s\n" "Register page" "error" 
fi

#R-Nu
var=`curl -s --request POST 'https://caroc.duckdns.org/register/'`
if [ "$var" = "Username is required." ]; then
    printf "%s\t%s\n" "Register (no username)" "success" 
else 
    printf "%s\t%s\n" "Register (no username)" "error" 
fi

#R-U-Np
var=`curl -s -X POST -d "username=mario.espinoza" 'https://caroc.duckdns.org/register/'`
if [ "$var" = "Password is required." ]; then
    printf "%s\t%s\n" "Register (username/no password)" "success" 
else 
    printf "%s\t%s\n" "Register (username/no password)" "error" 
fi

#R-U-P
var=`curl -s -X POST -d "username=j&password=1234" 'https://caroc.duckdns.org/register/'`
if [ "$var" = "User r created successfully" ]; then
    printf "%s\t%s\n" "Register (username&password)" "success" 
else 
    printf "%s\t%s\n" "Register (username&password)" "error" 
    echo "$var"
fi

#R-U-P-repeated
var=`curl -s -X POST -d "username=mario.espinoza&password=1234" 'https://caroc.duckdns.org/register/'`
if [ "$var" = "User mario.espinoza is already registered." ]; then
    printf "%s\t%s\n" "Register (already registered)" "success" 
else 
    printf "%s\t%s\n" "Register (already registered)" "error" 
    #echo "$var"
fi

#L-Nu
var=`curl -s --request POST 'https://caroc.duckdns.org/login/'`
if [ "$var" = "Incorrect username." ]; then
    printf "%s\t%s\n" "Login (no username)" "success" 
else 
    printf "%s\t%s\n" "Login (no username)" "error" 
fi

#L-U-Np
var=`curl -s -X POST -d "username=mario.espinoza" 'https://caroc.duckdns.org/login/'`
if [ "$var" = "Incorrect password." ]; then
    printf "%s\t%s\n" "Login (correct username/no password)" "success" 
else 
    printf "%s\t%s\n" "Login (correct username/no password)" "error" 
fi

#L-Wu-Np
var=`curl -s -X POST -d "username=mario" 'https://caroc.duckdns.org/login/'`
if [ "$var" = "Incorrect username." ]; then
    printf "%s\t%s\n" "Login (wrong username/no password)" "success" 
else 
    printf "%s\t%s\n" "Login (wrong username/no password)" "error" 
fi

#L-U-Wp
var=`curl -s -X POST -d "username=mario.espinoza&password=1238" 'https://caroc.duckdns.org/login/'`
if [ "$var" = "Incorrect password." ]; then
    printf "%s\t%s\n" "Login (username/wrong password)" "success" 
else 
    printf "%s\t%s\n" "Login (username/wrong password)" "error" 
fi

#L-U-P
var=`curl -s -X POST -d "username=mario.espinoza&password=1234" 'https://caroc.duckdns.org/login/'`
if [ "$var" = "Login Successful" ]; then
    printf "%s\t%s\n" "Login (username/right password)" "success" 
else 
    printf "%s\t%s\n" "Login (username/right password)" "error" 
fi