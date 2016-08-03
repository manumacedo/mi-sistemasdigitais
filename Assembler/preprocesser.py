from sys import argv

arc = open("Algoritmos/potencia.asm")
arc2 = open("result.asm","w")  # arquivo resultante
for i in range(30):
    line= arc.readline()
    if [line is ";"]:
        print " entrou"
        s= line
        comeco = s.find(";")
        resultante = s[:comeco]  # pego da string somente a instrucao
        arc2.write(resultante+"\n")
