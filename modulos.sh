#! bin/bash

#filtra conteúdo dos módulos carregados informando nome e endereço de memória de baixo para cima 
# grep 0xff -v (mostra apenas números
# a="(comandos)" armazena valores em uma variável
# tac = mostra conteúdo de arquivo de forma inversa 


 a="$(cat /proc/modules | cut -d" " -f1,6 | tr " " "\n")"; echo $a | tr " " "\n" | grep 0xff -v ; echo $a | tr " " "\n" | grep "0xff" | tac

