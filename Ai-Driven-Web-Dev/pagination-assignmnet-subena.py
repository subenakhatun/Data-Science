# Pagination Assignment

total_items = int(input("Enter Total Items: "))
per_page = int(input("Items Per Page: "))
page_number = int(input("Enter Page Number: "))

# Step 1: Create Total Data
total_data = []
 g 
for i in range(1, total_items + 1):
    total_data.append(i)

# Step 2: Create Pages
pages = []
current_page = []

for i in range(len(total_data)):
    current_page.append(total_data[i])

    if len(current_page) == per_page:
        pages.append(current_page)
        current_page = []

# Step 3: Add Remaining Data (if any)
if len(current_page) > 0:
    pages.append(current_page)

# Step 4: Show Requested Page

if page_number >= 1 and page_number <= len(pages):
    print(f"Page {page_number} Data:")
    print(pages[page_number - 1])
else:
    print("Invalid Page Number")