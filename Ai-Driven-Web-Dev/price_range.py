'''
Algorithm: Product Search & Multiple Filter System

Step 1:
Create a list of dictionaries for products.

Step 2: Create an empty list to store matched products.

Step 3: Take input from the user.
    - Product Name (Optional)
    - Category (Optional)
    - Brand (Optional)
    - Availability (Optional)
    - Minimum Price (Optional)
    - Maximum Price (Optional)

Step 4:
Apply a for loop to the products list.

Step 5:
For each product, check every input field one by one.
    - If the user provides Product Name, check Product Name.
    - If the user provides Category, check Category.
    - If the user provides Brand, check Brand.
    - If the user provides Availability, check Availability.
    - If the user provides a Price Range, check whether the product price is within the range.

Step 6:
If the product satisfies the required condition(s),
append the product to the matched products list.

Step 7:
Continue checking the remaining products until the loop finishes.

Step 8:
If the matched products list is empty,
display "No Product Found".

Step 9:
Otherwise,
display all matched products.
'''

# Step1: Create a list of dictionaries for products.
products = [

    {
        "product_name": "Gree 4 Ton Inverter Cassette AC",
        "category": "Cassette AC",
        "price": 235000,
        "availability": "In Stock",
        "brand": "Gree"
    },
    {
        "product_name": "Hisense 4 Ton Cassette AC",
        "category": "Cassette AC",
        "price": 268000,
        "availability": "Pre Order",
        "brand": "Hisense"
    },
    {
        "product_name": "Gree 4 Ton Ceiling AC",
        "category": "Ceiling AC",
        "price": 289000,
        "availability": "In Stock",
        "brand": "Gree"
    },
    {
        "product_name": "Gree 5 Ton Ceiling AC",
        "category": "Ceiling AC",
        "price": 315000,
        "availability": "Up Coming",
        "brand": "Gree"
    },
    {
        "product_name": "Daikin 2 Ton Split AC",
        "category": "Split AC",
        "price": 92000,
        "availability": "In Stock",
        "brand": "Daikin"
    },
    {
        "product_name": "Daikin 1.5 Ton Split AC",
        "category": "Split AC",
        "price": 78000,
        "availability": "Pre Order",
        "brand": "Daikin"
    },
    {
        "product_name": "Midea 2 Ton Inverter AC",
        "category": "Split AC",
        "price": 88000,
        "availability": "In Stock",
        "brand": "Midea"
    },
    {
        "product_name": "LG 2 Ton Smart AC",
        "category": "Smart AC",
        "price": 115000,
        "availability": "In Stock",
        "brand": "LG"
    },
    {
        "product_name": "Samsung WindFree AC",
        "category": "Smart AC",
        "price": 125000,
        "availability": "Pre Order",
        "brand": "Samsung"
    },
    {
        "product_name": "Walton 1.5 Ton Inverter AC",
        "category": "Split AC",
        "price": 65000,
        "availability": "In Stock",
        "brand": "Walton"
    },
    {
        "product_name": "Sharp 2 Ton Inverter AC",
        "category": "Split AC",
        "price": 96000,
        "availability": "Up Coming",
        "brand": "Sharp"
    },
    {
        "product_name": "General 2 Ton Split AC",
        "category": "Split AC",
        "price": 105000,
        "availability": "In Stock",
        "brand": "General"
    },
    {
        "product_name": "Hitachi 2 Ton Premium AC",
        "category": "Premium AC",
        "price": 135000,
        "availability": "Pre Order",
        "brand": "Hitachi"
    },
    {
        "product_name": "Carrier 3 Ton Floor Standing AC",
        "category": "Floor Standing AC",
        "price": 385000,
        "availability": "In Stock",
        "brand": "Carrier"
    },
    {
        "product_name": "Carrier 5 Ton Floor Standing AC",
        "category": "Floor Standing AC",
        "price": 520000,
        "availability": "Up Coming",
        "brand": "Carrier"
    },
    {
        "product_name": "Mitsubishi Heavy 2 Ton AC",
        "category": "Premium AC",
        "price": 148000,
        "availability": "In Stock",
        "brand": "Mitsubishi"
    }

]
# Step 2: Create an empty list to store matched products.
search_new_products = []

# Step 3: Take input from the user.
min_price = int(input("Enter Minimum Price: "))
max_price = int(input("Enter Maximum Price: "))
product_Name = input("Enter Product Name: ")
category = input("Enter a Category: ")
brand = input("Enter a Brand Name: ")
availability = input("Check In Stock or Not: ")

for product in products:
     # Product Name Filter
    if product_Name:
        if product_Name.lower() not in product["product_name"].lower():
            continue

    # Category Filter
    if category:
        if category.lower() not in product["category"].lower():
            continue

    # Brand Filter
    if brand:
        if brand.lower() not in product["brand"].lower():
            continue

    # Availability Filter
    if availability:
        if availability.lower() not in product["availability"].lower():
            continue

    # Price Range Filter
    if min_price and product["price"] < min_price:
        continue

    if max_price and product["price"] > max_price:
        continue

    # সব Filter Pass করলে Product Add হবে
    search_new_products.append(product)

if search_new_products:
    for new_product in search_new_products:
        print(new_product)
else:
    print("Product not Found")