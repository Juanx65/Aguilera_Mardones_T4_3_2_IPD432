arch = open("struct_BRAM.txt", "w")

s = "XEuchw_Write_{BRAM}_{br}_Words"
size = 128


##BRAMS A
BR = "x"

arch.write("void (*XHLSWriteFunc[])() = { " + s.format(BRAM = BR, br = 0) + ", \n")


i = 1
while (i < size-2):
    arch.write(3*"\t" + s.format(BRAM = BR,  br = i) + ", " + s.format(BRAM = BR,  br = (i+1)) +  
               ", "+ s.format(BRAM = BR,  br = (i+2)) + ",\n")
             
    i+=3

arch.write(3*"\t" +  s.format(BRAM = BR, br = size -1) + "};")


arch.write("\n\n")


##BRAMS B
BR = "B"
arch.write("void (*XHLSWriteFunc[])() = { " + s.format(BRAM = BR, br = 0) + ", \n")

i = 1
while (i < size-2):
    arch.write(3*"\t" + s.format(BRAM = BR,  br = i) + ", " + s.format(BRAM = BR,  br = (i+1)) +  
               ", "+ s.format(BRAM = BR,  br = (i+2)) + ",\n")
             
    i+=3

arch.write(3*"\t" +  s.format(BRAM = BR, br = size -1) + "};")

arch.close()









