def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts 'Name: '
  name = gets.strip
   # while the name is not empty, repeat this code
  while !name.empty? do
      puts "Cohort: "
      cohort = gets.chomp.to_sym
      puts "Hobbies: "
      hobbies = gets.chomp
      puts "Country of Birth: "
      countrybirth = gets.chomp
      puts "Height: "
      height = gets.chomp
      # Add the student hash to the array
      students << {name: name, cohort: cohort, hobbies: hobbies, countrybirth: countrybirth, height: height}
      if students.count > 1
        puts "Now we have #{students.count} students"
      else
        puts "Now we have #{students.count} student"
      end
      # get another name from the user, if the entry is blank the while loop will stop.
      puts "Name: "
      name = gets.chomp
  end
  # Return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  if !students.empty?
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) #{student[:hobbies]} #{student[:countrybirth]} #{student[:height]}"
    end
  end
end

def print_until(students)
  count = 0
  until students.length == count do
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Returns the name of students whose name begin with specific letters
def specific_letters(students)
  letters = ["A", "E", "I", "O", "U"]
  puts "The following students have letters beginning with #{letters.join(', ')}"
  students.each_with_index do |student, index|
    if letters.include? student[:name].to_s[0]
      puts student[:name]
    end
  end
end

# Returns the name of students whose name is shorter than 12 characters
def charlength(students)
  puts "The following students have names shorter than 12 characters."
  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts student[:name]
    end
  end
end

# Nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
specific_letters(students)
charlength(students)
