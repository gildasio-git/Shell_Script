#! bin/bash

#OBJETIVO: Obter informações de total de memória livre.
#ADICIONAL:Em subtração para obeter a memória em uso.

#greep Mem (Lista parte do texto que possuem string MEM)
#head -n2 (Pega as duas primeiras linhas do texto)
#cut -d":" -f2 (corta e deliminta a coluna 2)
#tr -d "[a-zA-Z]" (Exclui os textos proque o que queremos é apenas número)
#tr -d " " (Exclui os espaços vazios)
#tr "\n" "-" (substui as quebras de linhas por traços
#cut -d"-" -f1,2 (mosta apenas a primeira e segnda parte que contém os numeros que queremos calcular)
# bc  (calcula a diferença do resultado anterior recebido pela entrada de dadeos do comando anterior)


cat /proc/meminfo | grep Mem | head -n 2 | cut -d":" -f2 | tr -d "[a-zA-Z]" | tr -d " " | tr "\n" "-" | cut -d"-" -f1,2 | bc

