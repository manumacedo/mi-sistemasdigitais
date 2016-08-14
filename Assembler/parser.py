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
arc2 = open("resultado.txt","a")  # arquivo resultante

if [ line  is '.start']:
    print "sim"
    if [ arc.readline is ".text"]: # verificando se o programa segue as diretivas
        print "ok2"

    for line in arc.readlines():   # lendo as linhas
        binario="0000000000000000000000000000000"
        lista =[]
        palavra = re.escape(line) # separando a linha para pegar o minemonic
        palavra = palavra.split("\\")
        for p in palavra:
            p= p.strip()

            if p !='' and p !="," and p != ".text":
                lista.append(p)  # criando uma lista somente com os programas
        for p in lista:
            print lista   #reconhecer o R como o i
            print p;
             #p= p.strip()


            if typeR.has_key(p):  # Testando se e do tipo R
                print " entrou tipo R"
                dicio = typeR[p]
                binario = dicio['opcode'] + binario[6:31]
                i=0


                for pa in lista[1:]:
                    print "aqui tipo r"
                    if dicio['format'][i] == 'rs':
                        binario = binario[0:6] +  registers[pa] + binario[11:31]
                    if dicio['format'][i] == 'rt':
                        binario = binario[0:11] + registers[pa] + binario[16:31]
                    if dicio['format'][i] == 'rd':
                        binario= binario [0:16] + registers[pa] +  binario[21:31]
                         #    print binario
                    if dicio['format'][i] == 'shift' :
                        inteiro = int(pa)
                        binario+=str('{0:016b}'.format(inteiro))
                        print "shift"
                    i = i+1
                print binario + "aquicarai"
                binario=  binario [0:21] + dicio["defaults"]["shift"] + dicio["funct"]



                break
                opcode + rs + rt + imediato
            elif typeI.has_key(p):  # Testando se e do tipo I
                print " entrou tipo I"
                dicio = typeI[p]
                binario = dicio['opcode'] + binario[6:31] # adiciona o binario do opcode no binario final
                i=0
                for pa in lista[1:]:
                    print "aqui tipo i"
                    if dicio['format'][i] == 'rs':
                        binario = binario[0:6] + registers[pa] + binario[11:31]
                    if dicio['format'][i] == 'rt':
                        binario = binario[0:11] + registers[pa] +binario[16:31]

                    if dicio['format'][i] == 'immediate' :
                        inteiro = int(pa)
                        bina =str('{0:016b}'.format(inteiro)) #adicionario numero inteiro no binario final
                        binario= binario [0:16] + bina
                    i = i+1

                    print binario

                break

            elif typeJ.has_key(p):
                print "tipo J"
                dicio = typeJ[p]
                binario += dicio ['opcode']
                break


        arc2.write(binario+"\n")

        print "vai pro final"


else:
     print "Deu pau"
