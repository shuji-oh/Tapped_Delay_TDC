num = 201

print("    Sum2[0] <= 1 ^ Hit ^ Ci;")
print("    Co2[0] <= (1&Hit | (1|Hit)&Ci);")
print("\n",end="")
'''

for i in range(1, num):
    print("    Sum2[",i,"] <= 1 ^ 0 ^ Co2[",i-1,"];")
    print("    Co2[",i,"] <= (1&0 | (1|0)&Co2[",i-1,"]);")
    print("\n",end="")
'''
print("if (Sum[",num-1,"]==0) Sum_hex = ",num-1,";")
print("\n",end="")
for i in range(1, num):
    print("else: if (Sum[",num-1-i,"]==0) Sum_hex =",num-1-i,";")
'''
for i in range(1, num):
    print("adder:adder_",i,"(.Sum(Sum[",i,"]),:.Co(Co[",i,"]),:.A(1),:.B(0),:.Ci(Co[",i-1,"]));")
'''
