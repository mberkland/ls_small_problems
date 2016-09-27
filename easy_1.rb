# Exercise 1
# Write a method that takes two arguments, a string and a positive integer, and
# prints the string as many times as the integer indicates.

def repeat(str, num)
  num.times { puts str }
end

repeat("Hello", 3)

# Exercise 2
# Write a method that takes one argument in the form of an integer or a float; this
# argument may be either positive or negative. This method should check if a number
# is odd, returning true if its absolute value is odd. Floats should only return true
# if the number is equal to its integer part and the integer is odd.

# Keep in mind that you're not allowed to use #odd? or #even? in your solution

def is_odd?(num)
  absolute_num = num.abs
  if absolute_num % 2 == 0 || num.to_i != num
    return false
  else
    return true
  end
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(7.1)  # => false
puts is_odd?(-5.0) # => true

# Exercise 3
# Write a method that takes one argument, a positive integer, and returns a list
# of the digits in the number.

def digit_list(num)
  int_array = []
  digit_array = num.to_s.split(//)
  digit_array.each do |numb|
    int_array += [numb.to_i]
  end
  int_array
end

p digit_list(12345)
p digit_list(7)
p digit_list(375290)
p digit_list(444)

# Exercise 4
# Write a method that counts the number of occurrences of each element in a
# given array.

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(arr)
  unique_elements = arr.uniq

  unique_elements.each do |element|
    puts "#{element} =>  #{arr.count(element)}"
  end
end

count_occurrences(vehicles)

# Exercise 5
# Write a method that takes one argument, a string, and returns the same string
# with the words in reverse order.

def reverse_sentence(sentence)
  sentence_array = sentence.split(" ")
  reverse_array = []
  iterator = sentence_array.length
  while iterator > 0
    reverse_array << sentence_array[(iterator - 1)]
    iterator -= 1
  end
 reverse_array.join(' ')
end

puts reverse_sentence('') # == ''
puts reverse_sentence('Hello World') # == 'World Hello'
puts reverse_sentence('Reverse these words') # == 'words these Reverse'

# Exercise 6
# Write a method that takes one argument, a string containing one or more words,
# and returns the given string with all five or more letter words reversed. Each
# string will consist of only letters and spaces. Spaces should be included only
# when more than one word is present.

def reverse_words(words)
  arr_words = words.split(" ")
  reverse_array = []
  arr_words.each do  |word|
    if word.length >= 5
      reverse_array << word.reverse
    else
      reverse_array << word
    end
  end
  reverse_array.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# Exercise 7
# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of the
# string should match the given integer.

def stringy(number)
  number_range = (1..number)
  binary = []
  number_range.each do |num|
    if num % 2 == 1
      binary << 1
    elsif num % 2 == 0
      binary << 0
    end
  end
  binary.join("")
end

puts stringy(6) # == '101010'
puts stringy(9) # == '101010101'
puts stringy(4) # == '1010'
puts stringy(7) # == '1010101'

# Exercise 8
# Write a method that takes one argument, an array containing integers, and
# returns the average of all numbers in the array. The array will never be empty
# and the numbers will always be positive integers.

def average(num_array)
  sum = 0
  num_array.each { |num| sum += num }
  sum / num_array.length
end



puts average([1, 5, 87, 45, 8, 8]) # == 25
puts average([9, 47, 23, 95, 16, 52]) # == 40

# Exercise 9
# Write a method that takes one argument, a positive integer, and returns the
# sum of its digits.

def sum(number)
  num_array = number.to_s.split(//)
  number_sum = 0
  num_array.each { |num| number_sum += num.to_i }
  number_sum
end

puts sum(23) # == 5
puts sum(496) # == 19
puts sum(123_456_789) # == 45

# Exercise 10
# Write a method that takes two arguments, a positive integer and a boolean, and
# calculates the bonus for a given salary. If the boolean is true, the bonus
# should be half of the salary. If the boolean is false, the bonus should be 0.


def calculate_bonus(salary, bonus)
  if bonus == true
    salary / 2
  else
    0
  end
end


puts calculate_bonus(2800, true) # == 1400
puts calculate_bonus(1000, false) # == 0
puts calculate_bonus(50000, true) # == 25000