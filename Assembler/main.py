from preprocesser import preprocesser
from parser import parser

arc = open("Algoritmos/test.asm")
arc2 = open("result.asm","w")  # arquivo resultante

diclabels = {}


#parser = new parser()
preprocesser = preprocesser()


preprocesser.notcoment(arc,arc2) # retirando os comentarios
arc2.close()   #fechando o arquivo depois de retirar os comentarios

arc2 = open("result.asm")  #  reabrindo o arquivo resultante

preprocesser.sizeText(arc2,diclabels)
parser = parser()
parser.run()
