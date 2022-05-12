require 'csv'
@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  #students = []
  # get the first name
  puts 'Name: '
  # Can use gets.strip instead of gets.chomp to remove last return character
  name = STDIN.gets.chomp
   # while the name is not empty, repeat this code
  while !name.empty? do
      puts "Cohort: "
      cohort = STDIN.gets.chomp.to_sym
      puts "Hobbies: "
      hobbies = STDIN.gets.chomp
      puts "Country of Birth: "
      countrybirth = STDIN.gets.chomp
      puts "Height: "
      height = STDIN.gets.chomp
      # Add the student hash to the array
      #@students << {name: name, cohort: cohort, hobbies: hobbies, countrybirth: countrybirth, height: height}
      add_student(name, cohort, hobbies, countrybirth, height)
      if @students.count > 1
        puts "Now we have #{@students.count} students"
      else
        puts "Now we have #{@students.count} student"
      end
      # get another name from the user, if the entry is blank the while loop will stop.
      puts "Name: "
      name = STDIN.gets.chomp
  end
  # Return the array of students
  @students
end

def add_student(name, cohort, hobbies, countrybirth, height)
  @students << {name: name, cohort: cohort, hobbies: hobbies, countrybirth: countrybirth, height: height}
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students_list
  if !@students.empty?
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) #{student[:hobbies]} #{student[:countrybirth]} #{student[:height]}"
    end
  end
end

def print_until
  count = 0
  until students.length == count do
    puts "#{@students[count][:name]} (#{students[count][:cohort]} cohort)"
    count += 1
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# Returns the name of students whose name begin with specific letters
def specific_letters
  letters = ["A", "E", "I", "O", "U"]
  puts "The following students have letters beginning with #{letters.join(', ')}"
  @students.each_with_index do |student, index|
    if letters.include? student[:name].to_s[0]
      puts student[:name]
    end
  end
end

# Returns the name of students whose name is shorter than 12 characters
def charlength
  puts "The following students have names shorter than 12 characters."
  @students.each_with_index do |student, index|
    if student[:name].length < 12
      puts student[:name]
    end
  end
end

# Returns the name of students grouped by cohorts
def print_cohortgroup
  puts (@students.group_by{|element| element[:cohort]}.each{|_, value| value.map!{|element| element[:name]}})
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # puts "Please enter a filename:"
  # filename = gets.chomp
  # CSV.open(filename, "wb") do |csv|
  #   @students.each do |student|
  #   csv << [student[:name], student[:cohort], student[:hobbies], student[:countrybirth], student[:height]]
  #   end
  # end
  # puts "File saved."
  puts "Please enter a filename:"
  filename = gets.chomp
  # open the file for writing
  file = File.open(filename, "w") do |file|
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:countrybirth], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  end
  #file.close
  puts "File saved."
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row|
    name, cohort, hobbies, countrybirth, height = row
    add_student(name, cohort, hobbies, countrybirth, height)
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  # Load the Students CSV file if no default value given
  if filename.nil?
    filename = "students.csv"
  end
  return if filename.nil? # get out of the method if it isn't given
  if File.exist?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, default file #{filename} doesn't exist. No data has been loaded"
    # exit # quit the program
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    puts "Please enter the name of the file to load. Leave blank to load default file."
    load_students(gets.chomp)
  when "9"
    exit
  else
    puts "I don't know what you meant, try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

# input_students
# show_students
# specific_letters
# charlength
# print_cohortgroup
try_load_students
interactive_menu