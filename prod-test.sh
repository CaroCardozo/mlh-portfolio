#!/bin/bash

count=0
#login page
var=`curl -s --request GET 'https://caroc.duckdns.org/login/'`
if [ "$var" != "Login Page not yet implemented" ]; then
    count=1
fi

#register page
var=`curl -s --request GET 'https://caroc.duckdns.org/register/'`
if [ "$var" != "Register Page not yet implemented" ]; then
    count=1
fi

#R-Nu
var=`curl -s --request POST 'https://caroc.duckdns.org/register/'`
if [ "$var" != "Username is required." ]; then
    count=1
fi

#R-U-Np
var=`curl -s -X POST -d "username=mario.espinoza" 'https://caroc.duckdns.org/register/'`
if [ "$var" != "Password is required." ]; then
    count=1
fi

#R-U-P
var=`curl -s -X POST -d "username=locos&password=1234" 'https://caroc.duckdns.org/register/'`
if [ "$var" = "User loco created successfully" ]; then
    count=1
fi

#R-U-P-repeated
var=`curl -s -X POST -d "username=mario.espinoza&password=1234" 'https://caroc.duckdns.org/register/'`
if [ "$var" != "User mario.espinoza is already registered." ]; then
    count=1
fi

#L-Nu
var=`curl -s --request POST 'https://caroc.duckdns.org/login/'`
if [ "$var" != "Incorrect username." ]; then
    count=1
fi

#L-U-Np
var=`curl -s -X POST -d "username=mario.espinoza" 'https://caroc.duckdns.org/login/'`
if [ "$var" != "Incorrect password." ]; then
    count=1
fi

#L-Wu-Np
var=`curl -s -X POST -d "username=mario" 'https://caroc.duckdns.org/login/'`
if [ "$var" != "Incorrect username." ]; then
    count=1
fi

#L-U-Wp
var=`curl -s -X POST -d "username=mario.espinoza&password=1238" 'https://caroc.duckdns.org/login/'`
if [ "$var" != "Incorrect password." ]; then
    count=1
fi

#L-U-P
var=`curl -s -X POST -d "username=mario.espinoza&password=1234" 'https://caroc.duckdns.org/login/'`
if [ "$var" != "Login Successful" ]; then
    count=1
fi
exit $count
#return $count