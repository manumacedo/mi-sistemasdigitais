from sys import argv

arc = open("Algoritmos/potencia.asm")
arc2 = open("result.asm","w")  # arquivo resultante
gp=0
t=0
linhas = arc.readlines()
for line in linhas:
    if [line is ".text"]:
        print " encontrou "
        for line in linhas[t:]:
            if line is not [".end"]:
                gp= gp+1
    t=t+1
    break

print gp
for line in arc.readlines():
    if [line is ";"]:
        print " entrou"
        s= line
        comeco = s.find(";")
        resultante = s[:comeco]  # pego da string somente a instrucao
        arc2.write(resultante+"\n")
