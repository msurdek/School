data = [0, -1, 2, -3, 4, -5, 6, -7, 8]

print(data)

def printSum(x):
    accumulator = []
    for i in x:
        accumulator.append(i)
    return print(sum(accumulator))

printSum(data)

def printAbs(x):
    accumulator = []
    for i in x:
        accumulator.append(abs(i))
    return print(sum(accumulator))

printAbs(data)