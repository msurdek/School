def fact(n):
    if n == 1:
        return n
    else:
        return n * fact(n-1)

number = input("Please provide a positive integer: ")

try:
    number = int(number)
    if number > 0:
        print(fact(number))
    else:
        print("The number you provided is not a positive integer")
except:
    print("The number you provided is not a positive integer")