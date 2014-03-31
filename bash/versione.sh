#!/bin/bash
declare -a arr=(int)

#declare -a arr=(19900614)
## now loop through the above array
for i in "${arr[@]}"
do
   
   wget --output-document=$i.html --post-data 'nroexpediente='$i'&cdgprod=&grupo=2' --no-check-certificate http://web.sivicos.gov.co:8080/consultas/consultas/consproductocum.jsp
   
   PESO=`du $i".html" | cut -f1`
   	if [ $PESO -eq 0 ]; then
    	
    	# el tiempo apropiado es entre 30 a 60 segundos
    	sleep 30

    	echo "se cancelo :( , joder pagina invima..."$i
	fi
   sleep 1
   # echo "aqui -> ("$?")"
done

