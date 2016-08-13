from sys import argv
from typeR import typeR
from typeI import typeI
from registers import registers
import re

def completar(bin):
    tamanho = len(bin)
    for i in range(tamanho,32):
        bin += str(0)
    return bin

arc = open("Algoritmos/test.asm")
line = arc.readline();


if [ line  is '.start']:
    print "sim"
    if [ arc.readline is ".text"]: # verificando se o programa segue as diretivas
        print "ok2"

    for line in arc.readlines():   # lendo as linhas
        binario=""
        lista =[]
        palavra = re.escape(line) # separando a linha para pegar o minemonic
        palavra = palavra.split("\\")
        for p in palavra:
            p= p.strip()

            if p !='' and p !="," and p != ".text":
                lista.append(p)
        for p in lista:
            print lista   #reconhecer o R como o i
            print p;
             #p= p.strip()


            if typeR.has_key(p):  # Testando se e do tipo R
                print " entrou tipo R"
                dicio = typeR[p]
                binario += dicio['opcode']
                i=0
                for pa in lista[1:]:
                    print pa
                    print i
                    print "aqui tipo r"
                    if dicio['format'][i] == 'rt' or dicio['format'][i] == 'rs' or dicio['format'][i] == 'rd':
                        if registers.has_key(pa):
                            binario+= registers[pa]
                            print "regi tipo r"
                         #    print binario
                    if dicio['format'][i] == 'shift' :
                        inteiro = int(pa)
                        binario+=str('{0:016b}'.format(inteiro))
                        print "shift"
                    i = i+1

                    print binario
                break
            elif typeI.has_key(p):  # Testando se e do tipo I
                print " entrou tipo I"
                dicio = typeI[p]
                binario += dicio['opcode']  # adiciona o binario do opcode no binario final
                i=0
                for pa in lista[1:]:
                    print pa
                    print i
                    print "aqui tipo i"
                    if dicio['format'][i] == 'rt' or dicio['format'][i] == 'rs':
                        if registers.has_key(pa):
                            binario+= registers[pa]
                            print "regi tipo i"
                            print binario
                    if dicio['format'][i] == 'immediate' :
                        inteiro = int(pa)
                        binario+=str('{0:016b}'.format(inteiro)) #adicionario numero inteiro no binario final
                        print "imediato"
                    i = i+1

                    print binario
                break

            elif typeJ.has_key(p):
                print "tipo J"
                dicio = typeJ[p]
                binario += dicio ['opcode']
                break



            print binario
        print "vai pro final"
        binresult = completar(binario)  # completa o binario resultando da identificacao
        print binresult
else:
     print "Deu pau"
