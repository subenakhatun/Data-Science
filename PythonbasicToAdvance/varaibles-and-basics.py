#  Variables & Basics (10 problems)
"""
1.	Print “Hello, World!”
2.	Print your name and age on separate lines
3.	Add two numbers (user input)
4.	Subtract two numbers (user input)
5.	Multiply two numbers (user input)
6.	Divide two numbers (user input, handle float result)
7.	Swap two numbers without using a third variable
8.	Calculate the area of a rectangle (length & width input)
9.	Calculate the perimeter of a rectangle (length & width input)
10.	Convert Celsius to Fahrenheit (user input) """ 


# 1.	Print “Hello, World!”
print("HEllo Wolrd!")

# 2.Print your name and age on separate lines
print(f"My name is Subena\n My Age is 30")

# 3.Add two numbers (user input)
a = input("Enter A Number: ")
b = input("Enter Another Number: ")
c = int(a)+int(b)
print(f"Sum of {a} and {b} = {c}")

# 4.	Subtract two numbers (user input)
a = input("Enter A Number: ")
b = input("Enter Another Number: ")
c = int(a)-int(b)
print(f"Subtract of {a} and {b} = {c}")

# 5.	Multiply two numbers (user input)
a = input("Enter A Number: ")
b = input("Enter Another Number: ")
c = int(a)*int(b)
print(f"Multiply of {a} and {b} = {c}")

# 6.Divide two numbers (user input, handle float result)
a = input("Enter A Number: ")
b = input("Enter Another Number: ")
c = float(a)/float(b)
print(f"Multiply of {a} and {b} = {c}")

# 7.Swap two numbers without using a third variable
a = 6
b = 90
a,b = b,a 
print(a,b)

# 8.Calculate the area of a rectangle (length & width input)
a = 6
b = 90
print("Area of a ractangle",a*b)

# 9.Calculate the perimeter of a rectangle (length & width input)

a = int(input("Enter a side number: "))
b = int(input("Enter b side number: "))
c = int(input("Enter c side number: "))

perimeter = a+b+c
print(perimeter)