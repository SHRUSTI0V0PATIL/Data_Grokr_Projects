name=input("Enter the name of the student: ")
subjects = ["Python", "SQL", "Git"]
marks = {}

for subject in subjects:
    marks[subject]=int(input(f"Enter the marks obtained in {subject}: "))

print(marks)

def calculate_total(marks):
    total=0

    for mark in marks.values():
        total=total+mark
    return total
total=calculate_total(marks)
print("Total:", total)

average = total/len(subjects)
print("Average:", average)
def calculate_grade(average):
    if average < 0 or average > 100:
        print("Invalid marks entered")
        return "Invalid"
    elif average >= 90:
        grade = "A"
    elif average >= 75:
        grade = "B"
    elif average >= 60:
        grade = "C"
    elif average >= 40:
        grade = "D"
    else:
        grade = "F"
    return grade
grade = calculate_grade(average)
if grade=="Invalid":
    status="Invalid"
elif grade!="F":
    status = "PASS"
else:
    status = "FAIL"
    
print("\n===== RESULT =====")
print("Name:", name)

for subject in subjects:
    print(subject + ":", marks[subject])

print("Total:", total)
print("Average:", round(average, 2))
print("Grade:", grade)
print("Status:", status)