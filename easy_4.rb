# Question 1
# Write a method that takes two strings as arguments, determines the longest of
# the two strings, and then returns the result of concatenating the shorter string,
# the longer string, and the shorter string once again. You may assume that the
# strings are of different lengths.


def short_long_short(str1, str2)
  if str1.length > str2.length
    "#{str2}#{str1}#{str2}"
  else
    "#{str1}#{str2}#{str1}"
  end
end



p short_long_short('abc', 'defgh') #== "abcdefghabc"
p short_long_short('abcde', 'fgh')#  == "fghabcdefgh"
p short_long_short('', 'xyz') # == "xyz"


# Question 2
# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with st,
# nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000
# comprise the 20th century.

# New centuries begin in years that end with 01. So, the years 1901-2000
# comprise the 20th century.

def century(year)
  century = " "
  if year.to_s[-1] == "0"
    century = (year / 100).to_s
    "#{century}th"
  else
    century = ((year / 100) + 1).to_s
    if century[-1] == '1' && century[-2] != '1'
      "#{century}st"
    elsif century[-1] == '2' && century[-2] != '1'
      "#{century}nd"
    elsif century[-1] == '3' && century[-2] != '1'
      "#{century}rd"
    else
      "#{century}th"
    end
  end
end

puts century(2000) # == '20th'
puts century(2001) # == '21st'
puts century(1965) # == '20th'
puts century(256) # == '3rd'
puts century(5) # == '1st'
puts century(10103) # == '102nd'
puts century(1052) # == '11th'
puts century(1127) # == '12th'
puts century(11201) # == '113th'

# Question 3 and 4
# In the modern era under the Gregorian Calendar, leap years occur in every year
# that is evenly divisible by 4, unless the year is also divisible by 100.
# If the year is evenly divisible by 100, then it is not a leap year unless the
# year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that
# takes any year greater than 0 as input, and returns true if the year is a leap
# year, or false if it is not a leap year.

def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    elsif year % 4 == 0
      true
    else
      false
    end
  end
end


puts leap_year?(2016) # == true
puts leap_year?(2015) # == false
puts leap_year?(2100) # == false
puts leap_year?(2400) # == true
puts leap_year?(240000) # == true
puts leap_year?(240001) # == false
puts leap_year?(2000) # == true
puts leap_year?(1900) # == false
puts leap_year?(1752) # == true
puts leap_year?(1700) # == true
puts leap_year?(1) # == false
puts leap_year?(100) # == true
puts leap_year?(400) # == true

# Question 5
# Write a method that computes the sum of all numbers between 1 and some other
# number that are a multiple of 3 or 5. For instance, if the supplied number is
# 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

def multisum(num)
  multisum_array = []
  num_array = (1..num).to_a
  num_array.each do | number |
    if number % 3 == 0 || number % 5 == 0
      multisum_array.push(number)
    end
  end
  sum = 0
  multisum_array.each { |number| sum += number }
  sum
end


puts multisum(3) # == 3
puts multisum(5) # == 8
puts multisum(10) # == 33
puts multisum(1000) # == 234168

# Question 6
# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the
# original Array.

def running_total(arr)
  total = 0
  running_array = []
  arr.each_with_index do |number, index|
    if index == 0
      total += number
      running_array.push(number)
    else
      total += number
      running_array.push(total)
    end
  end
  running_array
end

p running_total([2, 5, 13]) # == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) # == [14, 25, 32, 47, 67]
p running_total([3]) # == [3]
p running_total([]) # == []

# Question 7
# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned.

# You may not use any of the standard conversion methods available in Ruby, such
# as String#to_i, Integer(), etc. Your method should do this the old-fashioned
# way and calculate the result by analyzing the characters in the string.

LETTERS_TO_NUMBERS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' =>5,
                      '6' => 6, '7' => 7, '8' => 8, '9' => 9}

def string_to_integer(string_num)
  string_array = string_num.split(//)
  num_array = []
  string_array.each do |str_num|
    num_array.push(LETTERS_TO_NUMBERS[str_num])
  end
  num_array.reverse!
  number = 0

  num_array.each_with_index do |num, index|
    number += num * 10 ** index
  end
  number
end


p string_to_integer('4321') # == 4321
p string_to_integer('570') # == 570

# Quesstion 8
# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. The String may have a leading + or - sign; if the first
# character is a +, your method should return a positive number; if it is a -,
# your method should return a negative number. If no sign is given, you should
# return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such
# as String#to_i, Integer(), etc. You may, however, use the string_to_integer
# method from the previous lesson.

def string_to_signed_integer(str)
  string_array = str.split(//)
  if string_array.include?('+')
    string_array.delete('+')
    string_to_integer(string_array.join)
  elsif string_array.include?('-')
    string_array.delete('-')
    string_to_integer(string_array.join) * -1
  else
    string_to_integer(string_array.join)
  end
end

p string_to_signed_integer('4321') # == 4321
p string_to_signed_integer('-570') # == -570
p string_to_signed_integer('+100') # == 100

# Question 9
# Write a method that takes a positive integer or zero, and converts it to a
# string representation.

# You may not use any of the standard conversion methods available in Ruby, such
# as Integer#to_s, String(), Kernel#format, etc. Your method should do this the
#old-fashioned way and construct the string by analyzing and manipulating the
# number.

NUMBERS_TO_STRING = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
                    6 => '6', 7 => '7', 8 => '8', 9 => '9'}

def integer_to_string(num)
  num_string = ''
  if num == 0
    num_string += NUMBERS_TO_STRING[num]
  else
    num_string += NUMBERS_TO_STRING[num % 10]
    until num <= 99
      num = num / 10
      num_string += NUMBERS_TO_STRING[num % 10]
   end
    num_string += NUMBERS_TO_STRING[num / 10]
  end
  num_string.reverse!
end

p integer_to_string(4321) # == '4321'
p integer_to_string(0) # == '0'
p integer_to_string(5000) # == '5000'

# Question 10
# Write a method that takes an integer, and converts it to a string
# representation.

# You may not use any of the standard conversion methods available in Ruby, such
# as Integer#to_s, String(), Kernel#format, etc. You may, however, use
# integer_to_string from the previous exercise.

def signed_integer_to_string(num)
  if num > 0
    "#{'+'}#{integer_to_string(num)}"
  elsif num < 0
    num = num * -1
    "#{'-'}#{integer_to_string(num)}"
  else
    integer_to_string(num)
  end
end

p signed_integer_to_string(4321) # == '+4321'
p signed_integer_to_string(-123) # == '-123'
p signed_integer_to_string(0) # == '0'