# Question 1
# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the
# same number of elements.

def interleave(arr1, arr2)
  iterator = 0
  combined_arr = []
  until combined_arr.length == arr1.length * 2 do
    combined_arr.push(arr1[iterator])
    combined_arr.push(arr2[iterator])
    iterator += 1
  end
  combined_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']

# Question 2
# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither.

def letter_case_count(str)
  case_count = {lowercase: 0, uppercase: 0, neither: 0}
  str_arr = str.split(//)
  str_arr.each do |item|
    if ("a".."z").to_a.include?(item)
      case_count[:lowercase] += 1
    elsif ("A".."Z").to_a.include?(item)
      case_count[:uppercase] += 1
    else
      case_count[:neither] += 1
    end
  end
  case_count
end

p letter_case_count('abCdef 123') # == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') # == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') # == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') # == { lowercase: 0, uppercase: 0, neither: 0 }

# Question 3
# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument, but the first letter of
# every word is now capitalized.

# You may assume that words are any sequence of non-blank characters, and that
# only the first character of each word must be considered.

def word_cap(phrase)
  phrase_arr = phrase.split(" ")
  phrase_arr.each { |word| word.capitalize! }
  phrase_arr.join(" ")
end

puts word_cap('four score and seven') # == 'Four Score And Seven'
puts word_cap('the javaScript language') # == 'The Javascript Language'
puts word_cap('this is a "quoted" word') # == 'This Is A "quoted" Word'

# Question 4
# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be
# unchanged.

# You may not use String#swapcase; write your own version of this method.

def swapcase(str)
  str_arr = str.split(//)
  str_arr.each do |letter|
    if ('a'..'z').to_a.include?(letter)
      letter.upcase!
    elsif('A'..'Z').to_a.include?(letter)
      letter.downcase!
    end
  end
  str_arr.join()
end

p swapcase('CamelCase') # == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') # == 'tONIGHT ON xyz-tv'

# Question 5
# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count as
# characters when switching between upper and lowercase.

def staggered_case(phrase)
  phrase_arr =  phrase.split(//)
  phrase_arr.each_with_index do |letter, index|
    if index % 2 == 0
      ('a'..'z').to_a.include?(letter) ? letter.upcase! : letter
    else
      ('A'..'Z').to_a.include?(letter) ? letter.downcase! : letter
    end
  end
  phrase_arr.join()
end

p staggered_case('I Love Launch School!') # == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') # == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') # == 'IgNoRe 77 ThE 444 NuMbErS'

# Question 6
# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the return
# value; they just don't count when toggling the desired case.

def staggered_case(phrase)
  str_phrase = phrase.split(//)
  iterator = 0
  str_phrase.each do |char|
    if char =~ /[^A-Za-z]/
      char
    elsif iterator % 2 == 0
      char.upcase!
      iterator += 1
    else
      char.downcase!
      iterator += 1
    end
  end
  str_phrase.join()
end

p staggered_case('I Love Launch School!') # == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') # == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') # == 'IgNoRe 77 ThE 444 nUmBeRs'

# Question 7
# Write a method that takes an Array of integers as input, multiplies all of the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places.

def show_multiplicative_average(arr)
  average = 1.0
  arr.each { |num| average *= num }
  average = (average/arr.length).round(3)
  puts format('%.3f', average)
end

show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667

# Question 8
# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each
# pair of numbers from the arguments that have the same index. You may assume
# that the arguments contain the same number of elements.

def multiply_list(arr1, arr2)
  iterator = 0
  multiply_arr = arr1.map do |num|
                  num *= arr2[iterator]
                  iterator += 1
                  num
  end
  multiply_arr
end

p multiply_list([3, 5, 7], [9, 10, 11]) # == [27, 50, 77]

# Question 9
# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of every
# pair of numbers that can be formed between the elements of the two Arrays.
# The results should be sorted by increasing value.

def multiply_all_pairs(arr1, arr2)
  product = 1
  product_arr = []
  nested_arr = arr1.product(arr2)
  nested_arr.each do |arr|
    arr.each do |number|
      product *= number
    end
    product_arr.push(product)
    product = 1
  end
  product_arr.sort!
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) # == [2, 4, 4, 6, 8, 8, 12, 16]

# Question 10
# Write a method that returns the next to last word in the String passed to it
# as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(phrase)
  phrase_arr = phrase.split(" ")
  phrase_arr[-2]
end

p penultimate('last word') # == 'last'
p penultimate('Launch School is great!') # == 'is'