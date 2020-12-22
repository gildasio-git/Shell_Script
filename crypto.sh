#! /bin/bash
#Exemplo script para criptografia

# Cria função que retorna o número correspondente a letra
# cut -b $a (corta carctere por caractere obedecendo o loop


n() { echo "a b c e e f g h i j k l m n o p q r s t u v x y w z" | cut -d"$1" -f1 | tr " " "\n" | wc -l ;}

#Função para incremente com letras aleatórias
la() { echo "A B C D E F G H I J K L M N O P Q R S T U V W X Y V" | cut -d" " -f$((($RANDOM%25)+1)); } 

#Verifica a passagem do argumento, se não foi passado sai do script, se foi o valor e gravado
#na variavel "ent"  e segue eme frente.
if [ "$1" == "" ]; then exit; fi

ent=$1
echo

#mostra a sgring original que sera criptografada
echo "String original: $ent"
echo 


#Primeiro passo, substitui as letras na ordem alfabética para ordem inversa
p1="$(echo $ent | tr "abcdefghijklmnopqrstuvxywz" "zwyxvwtsrqponmlkjihgfedcba")"

#Troca esapços originas por dois pontos para conseguir recupear o espaço original
p2="$(echo $p1 | tr " " ":")"

#Troca as quebras de linhas por @ mesmo principio para recuperar depois 
p3="$(echo $p2 | tr "\n" "@")"

#Separa cada carecter com espaços, pega cada letra que substitui e troca por equivalente 
#numérico
p4="$(for a in $(seq $(echo -n "$p3" | wc -c)); do


carac="$(echo "$p3" | cut -b $a)" 

#testa se o caractere faz parte do conjunt de caracteres da função N
  
  il="$(echo $carac | grep "[a-z]")"

#comparação
    if [ "$il" != "" ]; then
	  n $carac
           else
	    echo "$carac"
	 fi

 done | tr "\n" " ")"

#Multiplicar a primeira letra criptografada por 1 a segunda por 2 e assim 
#sucessivamente 
p5="$(for a in $p4; do
	     in="$(echo $a | grep "[1-9]")"

	 #verifica se é numero
	   if [ "$in" != "" ]; then
   	       let count++
	          echo -n "$(($a*$count))$(la)"
                    
	            else
	            #troca os espaços que separa cada número que equivale a cada letra por 
		    #letras aleatórias para confundir quem olha  
		      echo -n "$a$(la)"
         fi
 done)"

 echo $p5  
 echo
