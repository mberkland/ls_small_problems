# Exercise 1
# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongs the first 5 numbers.

def prompt(msg)
  puts "==> #{msg}"
end

def create_array
  num = 1
  num_array = []
  while num < 6
    prompt "Enter number #{num}"
    num1 = gets.chomp.to_i
    num_array.push(num1)
    num += 1
  end
  num_array
end

def last_num
  prompt "Enter last nmber"
  gets.chomp.to_i
end

def in_array?(array, number)
  array.include?(number)
end

if in_array?(create_array, last_num)
  puts "Your last number is in the array!"
else
  puts "Your last number is not in the array."
end

# Exercise 2
# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers: addition,
# subtraction, product, quotient, remainder, and power. Do not worry about
# validating the input.

puts "==> Enter the first number:"
num1 = gets.chomp.to_f
puts num1

puts "== Enter te second number:"
num2 = gets.chomp.to_f
puts num2

puts "#{num1} + #{num2} = #{num1 + num2}"
puts "#{num1} - #{num2} = #{num1 - num2}"
puts "#{num1} * #{num2} = #{num1 * num2}"
puts "#{num1} / #{num2} = #{num1 / num2}"
puts "#{num1} % #{num2} = #{num1 % num2}"
puts "#{num1} ** #{num2} = #{num1 ** num2}"

# Exercise 3
# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a
# character.

puts "Please write word or multiple words:"
words = gets.chomp
word_array = words.split(//)
if word_array.include?(" ")
    word_array.delete(" ")
end

puts "There are #{word_array.length} characters in '#{words}'."

# Exercise 4
# Create a method that takes two arguments, multiplies them together, and
# returns the result.

def multiply(num1, num2)
    num1 * num2
end

p multiply(5, 3)

# Exercise 5
# Using the multiply method from the "Multiplying Two Numbers" problem, write a
# method that computes the square of its argument (the square is the result of
# multiplying a number by itself).

def square(number)
    multiply(number, number)
end

puts square(9)

# Exercise 6
# In this exercise, you will write a method named xor that takes two arguments,
# and returns true if exactly one of its arguments is true, false otherwise.

def xor?(arg1, arg2)
    if arg1 && arg2
        false
    elsif !arg1 && !arg2
        false
    else
        true
    end
end

p xor?(5.even?, 4.even?) # == true
p xor?(5.odd?, 4.odd?) # == true
p xor?(5.odd?, 4.even?) # == false
p xor?(5.even?, 4.odd?) # == false

# Question 7
# Write a method that returns an Array that contains every other element of an
# Array that is passed in as an argument. The values in the returned list should
# be those values that are in the 1st, 3rd, 5th, and so on elements of the
# argument Array.

def oddities(arr)
  oddities_arr = []
  arr.each_with_index do  |item, index|
    oddities_arr.push(item) if index % 2 == 0
  end
  oddities_arr
end




p oddities([2, 3, 4, 5, 6]) # == [2, 4, 6]
p oddities(['abc', 'def']) # == ['abc']
p oddities([123]) # == [123]
p oddities([]) # == []

# Exercise 8
# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. (A palindrome reads the same forwards and
# backwards.) Case matters, and all characters should be considered.

def palindrome?(str)
  str == str.reverse
end


p palindrome?('madam') # == true
p palindrome?('Madam') # == false           - (case matters)
p palindrome?("madam i'm adam") # == false  - (all characters matter)
p palindrome?('356653') # == true

# Exercise 9
# Write another method that returns true if the string passed as an argument is
# a palindrome, false otherwise. This time, however, your method should be
# case-insensitive, and it should ignore all non-alphanumeric characters. If you
# wish, you may simplify things by calling the palindrome? method you wrote in
# the previous exercise.

def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(str)
  alpha_numeric = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
  str_array = str.split(//)
  reduced_array = str_array.select { |char| alpha_numeric.include?(char) }
  palindrome?(reduced_array.join.downcase)
end


 p real_palindrome?('madam') # == true
 p real_palindrome?('Madam') # == true            (case does not matter)
 p real_palindrome?("Madam, I'm Adam") # == true  (only alphanumerics matter)
 p real_palindrome?('356653') # == true
 p real_palindrome?('356a653') # == true
 p real_palindrome?('123ab321')# == false

# Question 10
# Write a method that returns true if its integer argument is palindromic, false
# otherwise. A palindromic number reads the same forwards and backwards.

def palindromic_number?(num)
  number_string = num.to_s
  number_string == number_string.reverse
end


p palindromic_number?(34543) # == true
p palindromic_number?(123210) # == false
p palindromic_number?(22) # ==  true
p palindromic_number?(5) # ==  true