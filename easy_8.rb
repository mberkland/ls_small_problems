# Question 1
# Write a method that takes an Array of numbers and then returns the sum of the
# sums of each leading subsequence for that Array. You may assume that the Array
# always contains at least one number.

def sum_of_sums(arr)
  sum = 0
  total = 0
  totals_arr = []
  arr.each do |num|
    total += num
    totals_arr.push(total)
  end
  totals_arr.each { |num| sum += num }
  sum
end

p sum_of_sums([3, 5, 2]) # == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) # == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) # == 4
p sum_of_sums([1, 2, 3, 4, 5]) # == 35

# Question 2
# Mad libs are a simple game where you create a story template with blanks for
# words. You, or another player, then construct a list of words and place them
# into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.

puts "Enter a noun:"
noun = gets.chomp

puts "Enter a verb:"
verb = gets.chomp

puts "Enter an adjective:"
adjective = gets.chomp

puts "Enter an adverb:"
adverb = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"

# Question 3
# Write a method that returns a list of all substrings of a string that start at
# the beginning of the original string. The return value should be arranged in
# order from shortest to longest substring.

def substrings_at_start(str)
  string_arr = str.split(//).to_a
  substring_arr = []
  total = ''
  string_arr.each do |letter|
    total += letter
    substring_arr.push(total)
  end
  p substring_arr
end

substrings_at_start('abc') # == ['a', 'ab', 'abc']
substrings_at_start('a') # == ['a']
substrings_at_start('xyzzy') # == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Question 4
# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This means
# that all substrings that start at position 0 should come first, then all
# substrings that start at position 1, and so on. Since multiple substrings will
# occur at each position, the substrings at a given position should be returned
# in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the
# previous exercise:

def substrings(string)
  new_string = string
  iterator = 0
  substrings_arr = []
  loop do
    substrings_arr.push(substrings_at_start(new_string))
    new_string = string[iterator..-1]
    iterator += 1
    break if iterator == string.length
  end
  substrings_arr.flatten
end

p substrings('abcde') # == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# Question 5
# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. The return value should be arranged
# in the same sequence as the substrings appear in the string. Duplicate
# palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous
# exercise.

# For the purposes of this exercise, you should consider all characters and pay
# attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
# "Abc-bA" are. In addition, assume that single characters are not palindromes.

def palindromes(str)
  palindromes_arr = []
  substring_arr = substrings(str)
  substring_arr.each do |sub_string|
    if sub_string.length > 1 && sub_string == sub_string.reverse
      palindromes_arr.push(sub_string)
    end
  end
  palindromes_arr
end

palindromes('abcd') # == []
palindromes('madam') # == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') # == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
palindromes('knitting cassettes') # == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# Question 6
# Write a method that takes two arguments: the first is the starting number, and
# the second is the ending number. Print out all numbers between the two numbers,
# except if a number is divisible by 3, print "Fizz", if a number is divisible
# by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print
# "FizzBuzz".

def fizzbuzz(num1, num2)
  num_range = (num1..num2).to_a
  num_range.each do |num|
    if num % 3 == 0 and num % 5 == 0
      puts "FizzBuzz"
    elsif num % 3 == 0
      puts "Fizz"
    elsif num % 5 == 0
      puts "Buzz"
    else
      puts num
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Question 7
# Write a method that takes a string, and returns a new string in which every
# character is doubled.

def repeater(str)
  str_arr = str.split(//)
  double_arr = []
  str_arr.each do |letter|
    2.times { double_arr.push(letter) }
  end
  double_arr.join()
end

p repeater('Hello') # == "HHeelllloo"
p repeater("Good job!") # == "GGoooodd  jjoobb!!"
p repeater('') # == ''

# Question 8
# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
# whitespace should not be doubled.

def double_consonants(str)
  str_arr = str.split(//)
  double_arr = []
  str_arr.each do |letter|
    if /[a-z]/.match(letter.downcase) && /[^aeiou]/.match(letter.downcase)
      2.times { double_arr.push(letter) }
    else
      double_arr.push(letter)
    end
  end
  double_arr.join()
end

p double_consonants('String') # == "SSttrrinngg"
p double_consonants("Hello-World!") # == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") # == "JJullyy 4tthh"
p double_consonants('') # == ""

# Question 9
# Write a method that takes a positive integer as an argument and returns that
# number with its digits reversed.

def reversed_number(num)
  number_string = num.to_s
  number_string.reverse.to_i
end

p reversed_number(12345) # == 54321
p reversed_number(12213) # == 31221
p reversed_number(456) # == 654
p reversed_number(12000) # == 21 # Note that zeros get dropped!
p reversed_number(1) # == 1

# Question 10
# Write a method that takes a non-empty string argument, and returns the middle
# character or characters of the argument. If the argument has an odd length,
# you should return exactly one character. If the argument has an even length,
# you should return exactly two characters.

def center_of(phrase)
  center = phrase.length/2
  if phrase.length % 2 == 1
    phrase[center]
  else
    phrase[center-1..center]
  end
end

p center_of('I love ruby') # == 'e'
p center_of('Launch School') # == ' '
p center_of('Launch') # == 'un'
p center_of('Launchschool') # == 'hs'
p center_of('x') # == 'x'
