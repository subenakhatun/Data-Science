'''
Algorithm

Step 1: Course_list name a akta list nei
Step 2: search_course nam a akta input filed nei 
step 3: found_course nam a akta empty list nei  
step 4: for loop apply kori course_list er upor 
step 5: jodi search_course a j nam search kora hoiche seta course_list a ase ki na chekc  kori
step 6: jodi search_course er sathe course list er kunu akta word mile jay thahole seta k append kori 
        found_course list a  
step 7: loop theke ber hoi 
Step 8: jodi found_course list emptyna hoy thahole print kori 
Step 9: jodi empty hoy found_course list thahole print kori not found 

'''
# Create a course list 
course_list = [
    "Machine Learning & AI agent for Voice Data Analysis",
    "Data Analytics With Machine Learning",
    "Machine Learning for Natural Language Processing",
    "Theory of Machine Learning (A-Z in Bangla) - Pre-recorded",
    "Data Analytics With Machine Learning (Offline)",
    "Machine Learning to AI Agent Development for Software Engineers (Offline Bootcamp)"
]

# find a course 
search_course = input("Enter a name of course: ")

# found course list create

found_course = []

for course in range(len(course_list)):
    
     if search_course.lower() in course_list[course].lower():
        found_course.append(course_list[course])

# aktar por akta dekhanur jonno ei ta kora
if found_course: 
    for course_item in range(len(found_course)):
        print(found_course[course_item])
else:
    print("Course Not found")