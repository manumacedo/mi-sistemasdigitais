from sys import argv
from typeR import typeR
from registers import registers

arc = open("Algoritmos/test.asm")

line = arc.readline();
binario =""
if [ line  is '.start']:
    print "sim"
    if [ arc.readline is ".pseg"]: # verificando se o programa segue as diretivas
        print "ok2"

    for line in arc.readlines():   # lendo as linhas
        palavra = line.split('$') # separando a linha pelo $ para pegar o minemonic
        print palavra
        for p in palavra:
            #resto = palavra[1]
            p = p.split(',')
            print p;
            p=p[0].strip()

            if typeR.has_key(p):   # verifica se e o tipo R
                binario += typeR[p]

                print "e do tipo r"
            if registers.has_key(p):
                print "registrador"
                binario+= registers[p]
        print binario
#        print resto[0].strip()

else:
     print "Deu pau"
