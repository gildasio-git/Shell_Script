#! bin/bash

a="$(nmap -sS -sV -F scanme.nmap.org | grep "open" | tr " " ":")" | tr ":" "\n" | cut -d"/" -f1 > t1
a="$(nmap -sS -sV -F scanme.nmap.org | grep "open" | tr " " ":")" | tr ":" "\n" | cut -d"/" -f4-99 > t2

cat t1 t2

#usando comando paste para juntar dois arquivos exibindo um na frente do outro 
paste t1 t2


#juntando todos os os comandos 

echo $a | tr ":" "\n" | cut -d"/" -f > t1; echo $a | tr ":" "\n" | cut -d" " -f4-99 > t2; paste t1 t2; rm t1 t2

