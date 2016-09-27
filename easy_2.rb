# Exercise 1
# Build a program that randomly generates and prints Teddy's age. To get the
# age, you should generate a random number between 20 and 200.

puts "Teddy is #{(20..200).to_a.sample} years old."

# Exercise 2
# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

def meter_area(width, length)
  length * width
end

def feet_area(meter_area)
  meter_area * 10.7639
end

puts "What is the length of the room?"
length = gets.chomp.to_i
puts "What is the width of the room?"
width = gets.chomp.to_i

puts "The area of the room is #{meter_area(width, length)} square meters "\
    "(#{feet_area(meter_area(width, length))} square feet)."

# Exercise 3
# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the tip
# and the total amount of the bill.

def calculate_tip(percent, bill)
  (percent/100.0) * bill
end

puts "What is the bill?"
bill = gets.chomp.to_i

puts "What is the tip percentage?"
tip_percent = gets.chomp.to_i

puts "The tip is $#{calculate_tip(tip_percent, bill)}"
puts "The total is $#{calculate_tip(tip_percent, bill) + bill}"

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

# Exercise 4
# Build a program that displays when the user will retire and how many years she has to work till retirement.

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!
year = Time.now.year
retirement_year = year + (retirement_age - age)

puts "It's #{year}. You will retire in #{retirement_year}."
puts "You ahve only #{retirement_age - age} years of work to go!"

# Exercise 5
# Write a program that will ask for user's name. The program will then greet the
# user. If the user writes "name!" then the computer yells back to the user.

def screaming?(word)
  word_array = word.split(//)
  word_array[-1] == "!"
end

puts "What is your name?"
name = gets.chomp
if screaming?(name)
  puts "Hello #{name}. Why are we screaming?".upcase
else
  puts "Hello #{name}."
end

# Exercise 6
# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed
# on separate lines.

(1..99).each { |number| puts number if number % 2 == 1 }

# Exercise 7
# Print the even numbers from 1 to 99, inclusive. All numbers should be printed
# on separate lines.

(1..99).each { |number| puts number if number % 2 == 0 }

# Exercise 8
# Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.

def prompt(msg)
  puts ">> #{msg}"
end

def valid_number?(num)
  num > 0
end

def sum(user_number)
  sum = 0
  num_array = (1..user_number).to_a
  num_array.each { |num| sum += num }
  sum
end

def product(user_number)
  product = 1
  num_array = (1..user_number).to_a
  num_array.each { |num| product *= num }
  product
end

loop do
  prompt "Please enter an integer greater than 0:"
  user_integer = gets.chomp.to_i
  if user_integer == -1
    break
  elsif valid_number?(user_integer)
    prompt "Enter 's' to compute the sum, 'p' to compute the product."
    operation = gets.chomp.downcase
    if operation == 's'
      puts "The sum of the numbers between 1 and #{user_integer} is #{sum(user_integer)}."
    elsif operation == 'p'
      puts "The product of the numbers between 1 and #{user_integer} is #{product(user_integer)}."
    else
      puts "Sorry that is not a valid operation"
    end
  end
end

# Exercise 9
# What does this print out? Can you explain these results?

# This will print BOB twice
# This is because name and save_name are both pointing to the same object 'Bob'
# in memory. When the method .upcase! is invoked on name it permanently changes
# the object that both variables are pointing to because .upcase! is destructive

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# Exercise 10
# What will the following code print, and why? Don't run the code until you have
# tried to answer.

# Ths will print out each value in the array:
# ["Moe", "larry", "CURLY", "CHEMP", "Harpo", "CHICO", "Grouco", "Zeppo"]
# This is because the first each loop copies a bunch of references from array1
# to array2. Therefore when the second each loop changes the values of the
# object the effects can be seen in both arrays since both arrays reference the
# same string objects


array1 = %w(Moe Larry Curly Chemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C') }
puts array2