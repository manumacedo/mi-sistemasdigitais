from sys import argv

arc = open("Algoritmos/potencia.asm")
arc2 = open("result.asm","w")  # arquivo resultante

def sizeText():
    gp=0
    t=0
    linhas = arc.readlines()
    for line in linhas:
        if [line is ".text"]:
            for line in linhas[t:]:
                if line is not [".end"] and line.find(":")==-1:  # verificando o tamanho do programa
                    print line
                    gp= gp+1

            return gp-1

        t=t+1
def dates():
    t=0
    linhas = arc.readline()
    for line i linhas:
        if[line is ".data"]:
            for line in linhas[t:]:
                if line is not [".text"]

def notcoment():
    for line in arc.readlines():
        if [line is ";"]:
            s= line
            comeco = s.find(";")
            resultante = s[:comeco]  # pego da string somente a instrucao
            arc2.write(resultante+"\n")

notcoment()
