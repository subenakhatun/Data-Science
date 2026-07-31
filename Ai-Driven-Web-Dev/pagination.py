
# Subena Khatun

total_data = [10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230]
pages = []
current_page_data = []
for i in range(len(total_data)):
    current_page_data.append(total_data[i])
    if len(current_page_data)==5:
        pages.append(current_page_data)
        current_page_data = []


# if total_data length is higher the per page limit data
if len(current_page_data) > 0:
    pages.append(current_page_data)

# Check page number 
user_search_number = int(input("Enter page number: "))
if 1 <= user_search_number <= len(pages):
    print(pages[user_search_number - 1])
else:
    print("Page Number Not Valid")