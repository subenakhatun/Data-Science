# Another code using built in

python_book = float(input("Python Book Price: "))
ai_book = float(input("AI Book Price: "))
dsa_book = float(input("DSA Book Price: "))

prices = [python_book, ai_book, dsa_book]

total = sum(prices)
average = total / len(prices)

python_ai = python_book + ai_book
max = max(prices)
min = min(prices)
difference = max - min

print("Total:", total)
print("Average:", average)
print("Python + AI:", python_ai)
print("Difference:", difference)
