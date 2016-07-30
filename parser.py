from sys import argv
from typeR import typeR

arc = open("Algoritmos/primos.asm")

line = arc.readline();
binario =""
if [ line  is '.start']:
    print "sim"
    if [ arc.readline is ".pseg"]: # verificando se o programa segue as diretivas
        print "ok2"

    for line in arc.readlines():   # lendo as linhas
        palavra = line.split('$') # separando a linha pelo $ para pegar o minemonic
        print palavra
#        resto = palavra[1]
        if typeR.has_key(palavra[0].strip()):   # verifica se e o tipo R
            p = palavra[0].strip();
            binario += typeR[p]

            print "e do tipo r"
#        print resto[0].strip()

else:
     print "Deu pau"
