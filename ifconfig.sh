#! bin/bash 

# FILTRAGEM COMANDO IFCONFIG
# Objetivo (obter o ip local)

ifconfig | grep "broadcast" | cut -d" " -f10

