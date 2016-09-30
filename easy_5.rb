# Question 1
# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the
# ASCII values of every character in the string. (You may use String#ord to
# determine the ASCII value of a character.)

def ascii_value(str)
  str_array = str.split(//)
  str_value = 0
  str_array.each { |string| str_value += string.ord }
  str_value
end

p ascii_value('Four score') # == 984
p ascii_value('Launch School') # == 1251
p ascii_value('a') # == 97
p ascii_value('') # == 0

# Question 2
# The time of day can be represented as the number of minutes before or after
# midnight. If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with any
# integer input.

# You may not use ruby's Date and Time classes.

def output_time_of_day(hours, minutes)
  hour_string = ' '
  if hours == 0 || hours == 24 || hours == -24
    hour_string = '00'
  elsif hours < 10
    hour_string = "#{0}#{hours}"
  else
    hour_string = hours.to_s
  end
  minute_string = ' '
  if minutes == 0
    minute_string = '00'
  elsif minutes < 10
    minute_string = "#{0}#{minutes}"
  else
    minute_string = minutes.to_s
  end
  puts "#{hour_string}:#{minute_string}"
end


def time_of_day(time)
  hours = 0
  minutes = 0
  if time > 60
    hours = time / 60
    if hours > 24
      hours = hours % 24
    end
  end
  if time < -60
    hours = time / 60
    if hours < -24
      hours = hours % 24
    end
  elsif time < 0
    hours = 24 - 1
  end
  minutes = time % 60
  output_time_of_day(hours, minutes)
end

time_of_day(0) # == "00:00"
time_of_day(-3) # == "23:57"
time_of_day(35) # == "00:35"
time_of_day(-1437) # == "00:03"
time_of_day(3000) # == "02:00"
time_of_day(800) # == "13:20"
time_of_day(-4231) # == "01:29"

# Question 3
# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

def after_midnight(str_time)
  total_minutes = 0
  str_array = str_time.split(":")
  hours = str_array[0].to_i
  minutes = str_array[1].to_i
  if hours == 24
    total_minutes += 0
  else
    total_minutes += hours * 60
  end
  puts total_minutes += minutes
end

def before_midnight(str_time)
  total_minutes = 0
  str_array = str_time.split(":")
  hours = str_array[0].to_i
  minutes = str_array[1].to_i
  if hours == 24 || hours == 0
    total_minutes += 0
  else
    hours = 23 - hours
    total_minutes += hours * 60
  end
  if minutes == 0
    total_minutes += 0
  else
    minutes = 60 - minutes
  end
  puts total_minutes += minutes
end

after_midnight('00:00') # == 0
before_midnight('00:00') # == 0
after_midnight('12:34') # == 754
before_midnight('12:34') # == 686
after_midnight('24:00') # == 0

# Quesetion 4
# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word is swapped.

# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word. You may also assume that each
# string contains nothing but words and spaces

def swap(phrase)
  phrase_array = phrase.split(" ")
  phrase_array.each do |word|
    to_front = word[-1]
    to_back = word[0]
    word[0] = to_front
    word[-1] = to_back
  end
  puts phrase_array.join(" ")
end


swap('Oh what a wonderful day it is')#  == 'hO thaw a londerfuw yad ti si'
swap('Abcde') # == 'ebcdA'
swap('a') # == 'a'

# Question 5
# Given a string that consists of some words and an assortment of non-alphabetic
# characters, write a method that returns that string with all of the
# non-alphabetic characters replaced by spaces. If one or more non-alphabetic
# characters occur in a row, you should only have one space in the result (the
# result should never have consecutive spaces).

def cleanup(phrase)
  alphabetic = ('A'..'Z').to_a + ('a'..'z').to_a
  replace_array = []
  phrase_array = phrase.split(" ")
  new_array = phrase_array.map do |word|
    word.split(//)
  end
  new_array.each do |split_word|
    split_word.each do |letter|
      if alphabetic.include?(letter) == false
        replace_array.push(letter)
      end
    end
  end
  replace_array.each do |character|
    phrase.gsub!(character, ' ')
  end
  phrase.squeeze(" ")
end

p cleanup("---what's my +*& line?") # == ' what s my line '

# This way is much simpler and uses regular expressions
def cleanup2(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

# Question 6
# Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

def word_sizes(phrase)
  word_sizes_hash = {}
  sizes = []
  keys = []
  phrase_array = phrase.split(" ")
  phrase_array.each do |word|
    sizes.push(word.count(word))
  end
  sizes.sort!
  keys = sizes.uniq
  keys.each do |key|
    word_sizes_hash[key] = sizes.count(key)
  end
  p word_sizes_hash
end

word_sizes('Four score and seven.') # == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') # == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") # == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') # == {}

# Question 7
# Modify the word_sizes method from the previous exercise to exclude non-letters
# when determining word size. For instance, the length of "it's" is 3, not 4.

def word_sizes(phrase)
  word_sizes_hash = {}
  sizes = []
  keys = []
  phrase_array = phrase.split(" ")
  phrase_array.each do |word|
    new_word = word.gsub(/[^a-z]/i, ' ').delete(' ')
    sizes.push(word.count(new_word))
  end
  sizes.sort!
  keys = sizes.uniq
  keys.each do |key|
    word_sizes_hash[key] = sizes.count(key)
  end
  p word_sizes_hash
end

word_sizes('Four score and seven.') # == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') # == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") # == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') # == {}

# Question 8
# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

NUMBER_TO_LETTER = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
                     5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
                     10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thriteen',
                     14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen',
                     17 => 'seventeen', 18 => 'eightteen', 19 => 'nineteen' }

def alphabetic_number_sort(num_arr)
  letter_array = []
  sorted_num_array = []
  num_arr.each do |number|
    letter_array.push(NUMBER_TO_LETTER[number])
  end
  letter_array.sort.each do |word|
    sorted_num_array.push(NUMBER_TO_LETTER.key(word))
  end
  sorted_num_array
end


p alphabetic_number_sort((0..19).to_a) # ==
[
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Question 9
# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character.

def crunch(phrase)
  phrase.squeeze
end

p crunch('ddaaiillyy ddoouubbllee') # == 'daily double'
p crunch('4444abcabccba') # == '4abcabcba'
p crunch('ggggggggggggggg') # == 'g'
p crunch('a') # == 'a'
p crunch('')  # == ''

# Question 10
# Write a method that will take a short line of text, and print it within a box.

def print_in_box(phrase)
  length = phrase.length
  half_length = length/2
  if length % 2 == 0
    space_end = half_length - 1
  else
    space_end = half_length
  end
  puts "+-#{"-"*(length * 2)}-+"
  puts "| #{" " * length}#{" " * length} |"
  puts "| #{" " * half_length}#{phrase}#{" " * space_end}  |"
  puts "| #{" " * length}#{" " * length} |"
  puts "+-#{"-"*(length * 2)}-+"
  puts phrase
end

print_in_box('To boldly go where no one has gone before.')
