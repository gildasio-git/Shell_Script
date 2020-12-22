#! bin/bash

#FILGRAGEM DE CONTEUDO (COMANDO "UNAME")
# cut -d" "  (Delimita por espaços vazios, cria uma quebra )
# -f 1,3,4 ( Selciona a primeira, segunda e terceira parte )
# tr " " "\n" ( substiui os espaços vazios por uma quebra de linha )

uname -a | cut -d" " -f 2,3,9 | tr " " "\n"
