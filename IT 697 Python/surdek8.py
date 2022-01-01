import turtle

t = turtle.Turtle()
wn = turtle.Screen()

def koch(t, order, size):
    order = int(order)
    if order == 0:
        t.forward(size)
    else:
        for angle in [60, -120, 60, 0]:
            koch(t, order - 1, size)
            t.left(angle)

order = input("Koch curve level number: ")
size = 50 / int(order)

t.penup()
t.setpos(-500, 0)
t.pendown()

koch(t, order, size)

wn.exitonclick()