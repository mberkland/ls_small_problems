# Question 1
# Create a method that takes 2 arguments, an array and a hash. The array will
# contain 2 or more elements that, when combined with adjoining spaces, will
# produce a person's name. The hash will contain two keys, :title and
# :occupation, and the appropriate values. Your method should return a greeting
# that uses the person's full name, and mentions the person's title.

def greetings(arr, hash)
  puts "Hello, #{arr.join(" ")}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# Question 2
# A double number is a number with an even number of digits whose left-side
# digits are exactly the same as its right-side digits. For example, 44, 3333,
# 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless
# the argument is a double number; double numbers should be returned as-is.
def twice(num)
  num_string = num.to_s
  mid = num_string.length / 2
  if num_string.length % 2 == 0
    arr1 = num_string.slice(0, mid)
    arr2 = num_string.slice(mid, num_string.length)
    if arr1 == arr2
      num
    else
      num * 2
    end
  else
    num * 2
  end
end

p twice(37) # == 74
p twice(44) # == 44
p twice(334433) # == 668866
p twice(444)  #== 888
p twice(107) # == 214
p twice(103103)  #== 103103
p twice(3333) # == 3333
p twice(7676) # == 7676
p twice(123_456_789_123_456_789) # == 123_456_789_123_456_789
p twice(5) # == 10

# Question 3
# Write a method that takes a number as an argument. If the argument is a
# positive number, return the negative of that number. If the number is 0 or
# negative, return the original number.

def negative(num)
  if num > 0
    num * -1
  else
    num
  end
end

p negative(5) # == -5
p negative(-3) # == -3
p negative(0) # == 0

# Question 4
# Write a method that takes an integer argument, and returns an Array of all
# integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is
# greater than 0.

def sequence(num)
  (1..num).to_a
end

p sequence(5) # == [1, 2, 3, 4, 5]
p sequence(3) # == [1, 2, 3]
p sequence(1) # == [1]

# Question 5
# Write a method that takes a string argument, and returns true if all of the
# alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored.

def uppercase?(str)
  str.upcase == str
end

p uppercase?('t') # == false
p uppercase?('T') # == true
p uppercase?('Four Score') # == false
p uppercase?('FOUR SCORE')  #== true
p uppercase?('4SCORE!') # == true
p uppercase?('') # == true

# Question 6
# Write a method that takes a string as an argument, and returns an Array that
# contains every word from the string, to which you have appended a space and
# the word length.

# You may assume that words in the string are separated by exactly one space,
# and that any substring of non-space characters is a word.

def word_lengths(phrase)
  words_lengths = []
  phrase_arry = phrase.split(" ")
  phrase_arry.each do |word|
    words_lengths.push("#{word} #{word.length}")
  end
  p words_lengths
end

word_lengths("cow sheep chicken") # == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") # ==
  # ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") # == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") # ==
  # ["Supercalifragilisticexpialidocious 34"]

word_lengths("") # == []

# Question 7
# Write a method that takes a first name, a space, and a last name passed as a
# single String argument, and returns a string that contains the last name,
# a comma, a space, and the first name.

def swap_name(name)
  name_arry = name.split(" ")
  "#{name_arry[1]}, #{name_arry[0]}"
end

p swap_name('Joe Roberts') # == 'Roberts, Joe'

# Question 8
# Create a method that takes two integers as arguments. The first argument is a
# count, and the second is the first number of a sequence that your method
# will create. The method should return an Array that contains the same number
# of elements as the count argument, while the values of each element will be
# multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or
# greater, while the starting number can be any integer value. If the count is 0,
# an empty list should be returned.

def sequence(count, num1)
  num_arr = []
  total = 0
  count.times do
    total += num1
    num_arr.push(total)
  end
  p num_arr
end

sequence(5, 1) # == [1, 2, 3, 4, 5]
sequence(4, -7) # == [-7, -14, -21, -28]
sequence(3, 0) # == [0, 0, 0]
sequence(0, 1000000) # == []

# Question 9
# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.

# Numerical Score Letter Grade 90 <= score <= 100 'A' 80 <= score < 90 'B' 70 <=
# score < 80 'C' 60 <= score < 70 'D' 0 <= score < 60 'F'

# Tested values are all between 0 and 100. There is no need to check for negative
# values or values greater than 100.

def get_grade(num1, num2, num3)
  average = (num1 + num2 + num3) / 3
  if average >= 90
    'A'
  elsif average >= 80
    'B'
  elsif average >= 70
    'C'
  elsif average >= 60
    'D'
  else
    'F'
  end
end

p get_grade(95, 90, 93) # == "A"
p get_grade(50, 50, 95) # == "D"

# Question 10
# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

def buy_fruit(nested__fruit_arr)
  fruit_array = []
  nested__fruit_arr.each do |arr|
    arr[-1].times { fruit_array.push(arr[0]) }
  end
  fruit_array
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) # ==
  # ["apples", "apples", "apples", "orange", "bananas","bananas"]