# Search algorithm
contact_list = [
'salman','nahid','sujon','Latifa','siyam',
'shuvo','rashed','durjoy','fahim',
'tanvir','anik','imaran','jahedul',
'salman','shuvo','durjoy','nahid'
]

target_list = input("Enter target value: ")
result_list = []
for i in range(len(contact_list)):
    if target_list == contact_list[i]:
        result_list.append(i)
print(result_list) 

