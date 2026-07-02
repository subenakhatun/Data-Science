 
x = python_book = float(input("Enter a Price for Python Book: "))
y = ai_book = float(input("Enter a Price for Python Book: "))
z = dsa_book = float(input("Enter a Price for Python Book: "))
items = 3
total_price = python_book + ai_book + dsa_book
print(f'Three Books Total: {total_price}')
average_price = total_price/3
print(f'Average Per Book Price: {average_price}')

x_y_price = x + y

if x>y and y>z:
    max = x
    min = z
    diff_maxmin = max - min
    print(f'Difference Between maximum PYTHON BOOK {max} and Minimum DSA BOOK {min} is: {diff_maxmin}')
elif x>z and z>y:
    max = x
    min = y
    diff_maxmin = max - min
    print(f'Difference Between maximum PYTHON BOOK {max} and Minimum AI BOOK {min} is: {diff_maxmin}')
elif y>x and x>z:
    max = y
    min = z
    diff_maxmin = max - min
    print(f'Difference Between maximum AI BOOK {max} and Minimum DSA BOOK{min} is: {diff_maxmin}')
elif y>z and z>x:
    max = y
    min = x
    diff_maxmin = max - min
    print(f'Difference Between maximum AI BOOK {max} and Minimum PYTHON BOOK {min} is: {diff_maxmin}')
elif z>x and x>y:
    max = z
    min = y
    diff_maxmin = max - min
    print(f'Difference Between maximum DSA BOOK {max} and Minimum AI BOOK {min} is: {diff_maxmin}')
elif z>y and y>x:
    max = z
    min = x
    diff_maxmin = max - min
    print(f'Difference Between maximum DSA BOOK  {max} and Minimum PYTHOn BOOK {min} is: {diff_maxmin}')

