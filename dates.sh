#!/bin/bash

#echo "Fecha inicial: "
#read inicial
ini=`date --date "$1" "+%s"`
echo $ini
#echo "Fecha final: "
#read final
fin=`date --date "$2" "+%s"`
echo $fin
while read p; 
do 
    date_act=`echo $p |sed -E 's/^.*\[(\S+[0-9]{4,4}):(\S+) \+0000\].*$/\1 \2/' | tr '/' ' ' | xargs -I'*' date --date "*" "+%s"`
    if [ $ini -le $date_act ] && [ $date_act -le $fin ]; then 
    echo $p;
    fi
    #echo $date_act
    #echo $seco
    #echo "/n"
#if[[$seco <= $inical && $seco >= $final ]] echo "$seco"
done < apache_access