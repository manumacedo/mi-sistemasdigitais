from sys import argv
from typeR import typeR
from typeI import typeI
from registers import registers
import re


arc = open("Algoritmos/test.asm")
line = arc.readline();


if [ line  is '.start']:
    print "sim"
    if [ arc.readline is ".pseg"]: # verificando se o programa segue as diretivas
        print "ok2"

    for line in arc.readlines():   # lendo as linhas
        binario=""
        lista =[]
        palavra = re.escape(line) # separando a linha para pegar o minemonic
        palavra = palavra.split("\\")
        for p in palavra:
            p= p.strip()

            if p !='' and p !="," and p != ".pseg":
                lista.append(p)
        for p in lista:
            print lista
            print p;
            p= p.strip()
            if typeR.has_key(p):   # verifica se e o tipo R
                binario += typeR[p]

                print "e do tipo r"

            elif typeI.has_key(p):
                print " entrou tipo I"
                dicio = typeI[p]
                binario += dicio['opcode']
                i=0
                for pa in lista[1:]:
                    print pa
                    print i
                    print "aqui"
                    if dicio['format'][i] == 'rt' or dicio['format'][i] == 'rs':
                        if registers.has_key(pa):
                            binario+= registers[pa]
                            print " regi"
                    if dicio['format'][i] == 'immediate' :
                        inteiro = int(pa)
                        binario+=str('{0:016b}'.format(inteiro))
                        print " imediato"
                    i = i+1

                    print binario
                    break;
            if registers.has_key(p):
                print "registrador"
                binario+= registers[p]



            print binario
#        print resto[0].strip()

else:
     print "Deu pau"
