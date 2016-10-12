# Question 1
# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end with
# periods (.), exclamation points (!), or question marks (?). Any sequence of
# characters that are not spaces or sentence-ending characters should be treated
# as a word. You should also print the number of words in the longest sentence.

count = 0
largest_count = 0
arr_position = 0
end_sentence_position = []
final_word_position = 0

text = File.read("speech.txt")
text_array = text.split(" ")
text_array.each do |word|
  count += 1
  arr_position += 1
  if word[-1] == "." || word[-1] == "!" || word[-1] == "?"
    end_sentence_position.push(arr_position - 1)
    if count > largest_count
      largest_count = count
      final_word_position = arr_position - 1
    end
    count = 0
  end
end

puts largest_count
final_word = final_word_position
first_word_position = end_sentence_position.index(final_word) - 1
first_word = end_sentence_position[first_word_position] + 1
p text_array[first_word, final_word].join(" ")

# Question 2
#  collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.

def block_word?(word)
  blocks_arr = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
               ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
               ['V', 'I'], ['L', 'Y'], ['Z', 'M']]
  word.upcase!
  word_arr = word.split(//)
  blocks_arr.each do |arr|
    if word_arr.include?(arr[0]) && word_arr.include?(arr[1])
      return false
    end
  end
  true
end

p block_word?('BATCH') # == true
p block_word?('BUTCH') # == false
p block_word?('jest') # == true

# Question 3
# In the easy exercises, we worked on a problem where we had to count the number
# of uppercase and lowercase characters, as well as characters that were neither
# of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the percentage of characters in the string that are
# lowercase letters, one the percentage of characters that are uppercase letters,
# and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def letter_percentages(str)
  case_count = {lowercase: 0, uppercase: 0, neither: 0}
  lowercase = 0
  uppercase = 0
  neither = 0
  str_arr = str.split(//)
  str_arr.each do |item|
    if ("a".."z").to_a.include?(item)
      lowercase += 1
    elsif ("A".."Z").to_a.include?(item)
      uppercase += 1
    else
      neither += 1
    end
  end
  total = str.size
  case_count[:lowercase] = lowercase * 100.0 / total
  case_count[:uppercase] = uppercase * 100.0 / total
  case_count[:neither] = neither * 100.0 / total
  p case_count
end

letter_percentages('abCdef 123') # == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') # == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') # == { lowercase: 0, uppercase: 0, neither: 100 }

# Question 4
# Write a method that takes a string as argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise. To be
# properly balanced, parentheses must occur in matching '(' and ')' pairs.

def balanced?(str)
  left_paren = 0
  right_paren = 0
  str_arr = str.split(//)
  str_arr.each do |char|
    if char == '('
      left_paren += 1
    end
    if char == ')'
      right_paren += 1
      return false if right_paren > left_paren
    end
  end
  return false if left_paren > right_paren
  true
end

p balanced?('What (is) this?') # == true
p balanced?('What is) this?') # == false
p balanced?('What (is this?') # == false
p balanced?('((What) (is this))?') # == true
p balanced?('((What)) (is this))?') # == false
p balanced?('Hey!') # == true
p balanced?(')Hey!(') # == false
p balanced?('What ((is))) up(') # == false

# Question 5
# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must
# be greater than the length of the longest side, and all sides must have lengths
# greater than 0: if either of these conditions is not satisfied, the triangle
# is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
# on whether the triangle is equilateral, isosceles, scalene, or invalid.

def triangle(num1, num2, num3)
  arr = [num1, num2, num3]
  arr.sort!
  if (arr[0] + arr[1]) <= arr[2]
    :invalid
  elsif arr.include?(0)
    :invalid
  else
    if num1 == num2 && num2 == num3
      :equilateral
    elsif num1 == num2 || num2 == num3
      :isosceles
    else
      :scalene
    end
  end
end

p triangle(3, 3, 3) # == :equilateral
p triangle(3, 3, 1.5) # == :isosceles
p triangle(3, 4, 5) # == :scalene
p triangle(0, 3, 3) # == :invalid
p triangle(3, 1, 1) # == :invalid

# Question 6
# A triangle is classified as follows:

# right - One angle of the triangle is a right angle (90 degrees)
# acute - All 3 angles of the triangle are less than 90 degrees
# obtuse - One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees,
# and all angles must be greater than 0: if either of these conditions is not
# satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and returns
# a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle
# is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about floating
# point errors. You may also assume that the arguments are specified in degrees.

def triangle(num1, num2, num3)
  if num1 + num2 + num3 != 180
    :invalid
  elsif num1 == 0 || num2 == 0 || num3 == 0
    :invalid
  else
    if num1 == 90 || num2 == 90 || num3 == 90
      :right
    elsif num1 > 90 || num2 > 90 || num3 > 90
      :obtuse
    elsif num1 < 90 && num2 < 90 && num3 < 90
      :acute
    else
      puts "ERROR"
    end
  end
end

p triangle(60, 70, 50) # == :acute
p triangle(30, 90, 60) # == :right
p triangle(120, 50, 10) # == :obtuse
p triangle(0, 90, 90) # == :invalid
p triangle(50, 50, 50) # == :invalid

# Question 7
# Write a method that returns the number of Friday the 13ths in the year passed
# in as an argument. You may assume that the year is greater than 1752 (when the
# modern Gregorian Calendar was adopted by the United Kingdom), and you may
# assume that the same calendar will remain in use for the foreseeable future.

require 'time'

def friday_13th?(year)
  count = 1
  friday_13ths = 0
  loop do
    t = Time.new(year, count, 13)
    if t.friday? == true
      friday_13ths += 1
    end
    count += 1
    break if count == 13
  end
  p friday_13ths
end

friday_13th?(2015) # == 3
friday_13th?(1986) # == 1

# Question 8
# A featured number (something unique to this exercise) is an odd number that is
# a multiple of 7, and whose digits occur exactly once each. So, for example, 49
# is a featured number, but 98 is not (it is not odd), 97 is not (it is not a
# multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the
# next featured number that is greater than the argument. Issue an error message
# if there is no next featured number.

def featured?(num)
  number = num.to_s.split(//)
  if num % 2 == 0
    false
  elsif number.uniq != number
    false
  elsif num % 7 == 0
    true
  else
    false
  end
end

def featured(num)
  loop do
    num += 1
    if featured?(num)
      return num
    end
    break if num >= 9_876_543_210
  end
  puts "There is no possible number that fulfills those requirements"
end

p featured(12) # == 21
p featured(20) # == 21
p featured(21) # == 35
p featured(997) # == 1029
p featured(1029) # == 1043
p featured(999_999) # == 1_023_547
# p featured(999_999_987)  #== 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those
# requirements

# Better way
# def featured(number)
#   number += 1
#   number += 1 until number.odd? && number % 7 == 0

#   loop do
#     number_chars = number.to_s.split('')
#     return number if number_chars.uniq == number_chars
#     number += 14
#     break if number >= 9_876_543_210
#   end

#   'There is no possible number that fulfills those requirements.'
# end

# Question 9
# Bubble Sort is one of the simplest sorting algorithms available. It isn't an
# efficient algorithm, but it's a great exercise for student developers. In this
# exercise, you will write a method that does a bubble sort of an Array.

# A bubble sort works by making multiple passes (iterations) through the Array.
# On each pass, each pair of consecutive elements is compared. If the first of
# the two elements is greater than the second, then the two elements are swapped.
#This process is repeated until a complete pass is made without performing any
# swaps; at that point, the Array is completely sorted.

# We can stop iterating the first time we make a pass through the array without
# making any swaps; at that point, the entire Array is sorted.

# For further information, including pseudo-code that demonstrates the algorithm
# as well as a minor optimization technique, see the Bubble Sort wikipedia page.

# Write a method that takes an Array as an argument, and sorts that Array using
# the bubble sort algorithm as just described. Note that your sort will be
# "in-place"; that is, you will mutate the Array passed as an argument. You may
# assume that the Array contains at least 2 elements.

def bubble_sort!(array)
  loop do
    changed_arr = []
    counter0 = 0
    counter1 = 1
    loop do
      if array[counter0] > array[counter1]
        temp1 = array[counter0]
        temp2 = array[counter1]
        array[counter0] = temp2
        array[counter1] = temp1
      else
        changed_arr.push(1)
      end
      counter0 += 1
      counter1 += 1
      break if counter1 == array.length
    end
    break if changed_arr.length == array.length - 1
  end
  p array
end

array = [5, 3]
bubble_sort!(array)
# array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
# # array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Question 10
# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n
# positive integers.

def sum_square_difference(num)
  sum = 0
  each_squared = 0
  num_range = (1..num).to_a
  num_range.each do |num|
    sum += num
    each_squared += num **2
  end
  sum_squared = sum ** 2
  sum_squared - each_squared
end

p sum_square_difference(3) # == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) # == 2640
p sum_square_difference(1) # == 0
p sum_square_difference(100) # == 25164150