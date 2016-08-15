from preprocesser import preprocesser
from parser import parser

arc = open("Algoritmos/test.asm")
arc2 = open("result.asm","w")  # arquivo resultante

diclabels = {}


preprocesser = preprocesser()


preprocesser.notcoment(arc,arc2) # retirando os comentarios
arc2.close()   #fechando o arquivo depois de retirar os comentarios
arc2 = open("result.asm")
preprocesser.sizeText(arc2,diclabels)
arc2 = open("result.asm")  #  reabrindo o arquivo resultante
preprocesser.removeLabel(arc2,diclabels)

p = parser()
p.run(diclabels)
