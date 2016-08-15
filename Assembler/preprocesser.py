from sys import argv


class preprocesser:
    def sizeText(self,arc,diclabels):
        gp=0
        t=0
        linhas = arc.readlines()
        for line in linhas:
            if [line is ".text"]:  # inicio do programa
                for line in linhas[t:]:  # para a lista de linhas comecar do inicio do progrrama
                    if line is not [".end"] and line.find(":")==-1:  # verificando o tamanho do programa
                        print line
                        gp= gp+1
                    if line.find(":")!= -1:
                        d= line.find(":")
                        gp= gp+1
                        print gp
                        label = line[:d].strip()
                        diclabels[label] = gp

                print diclabels
                return gp-1

            t=t+1
    def removeLabel(self,arc,diclabel):
        arc2 = open("result.asm","a")
        linhas = arc.readlines()
        t=1
        print "entrando"
        print diclabel.values()
        for line in linhas:
            if t in diclabel.values():
                print "yes"
                print line
                line = "\n"
                t= t+1
            else:
                print "not"
                t= t+1
    def dates():
        t=0
        linhas = arc.readline()
        for line in linhas:
            if[line is ".data"]:
                for line in linhas[t:]:
                    if line is not [".text"]:
                        t= t + 1
                    if line is [".text"]:
                         return t

    def notcoment(self,arc,arc2):
        for line in arc.readlines():
            if [line is ";"]:
                s= line
                comeco = s.find(";")
                resultante = s[:comeco]  # pego da string somente a instrucao
                arc2.write(resultante+"\n")

        return 1
