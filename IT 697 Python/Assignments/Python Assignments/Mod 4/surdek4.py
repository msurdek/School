#1) Print numbers 1 through 5
for x in range(5):
    if x >= 0: print(x+1)






#2) Print sum of 3 and 4
print(3+4)






#3) Print sum of constant pi and square root of 2
import math
print(math.pi + math.sqrt(2))






#4) Print sum of cos30 + sin30
print(math.cos(math.pi/6) + math.sin(math.pi/6))






#5) Write code to print values of integers x, y, and z in a single line such that each value is left-justified in 6 columns
def leftInts(x,y,z):
    x = str(x)
    y = str(y)
    z = str(z)
    line = (x.ljust(6), y.ljust(6), z.ljust(6))
    return print(line)

leftInts(400,6001,25)






#6) Write code to print area of a circle given the value of the radius of the circle
def area(radius):
    area = math.pi * radius ** 2
    return print(area)

area(radius = 8)






#7) Write code to print the greater of two given numbers x and y
def greater(x,y):
    if x > y:
        result = x
    elif x == y:
        print(x, ' and ', y, ' are equal ')
        result = ''
    else:
        result = y
    return print(result)

greater(20,30)






#8) Write code to print the result of negation of AND of two Boolean variables A and B
def nand(A,B):
    if A == 1 and B == 1:
        result = False
    else:
        result = True
    return print(result)

nand(True, False)






#9) Write a for-loop to sum the first 10 non-zero integers
x = 0
sum = 0
for x in range(11):
    sum = sum + x

print(sum)






#10) Write a while-loop to sum the first 10 non-zero integers
x = 1
sum = 0

while (x<=10):
    sum = sum + x
    x = x + 1

print(sum)






