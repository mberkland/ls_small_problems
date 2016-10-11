# Question 1
# Write a method that rotates an array by moving the first element to the end of
# the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(arr)
  rotated_arr = []
  if arr.length > 1
    arr.each_index do |index|
      next if index + 1 >= arr.length
      rotated_arr.push(arr[index + 1])
    end
  end
  rotated_arr.push(arr[0])
  rotated_arr
end


p rotate_array([7, 3, 5, 2, 9, 1]) # == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) # == ['b', 'c', 'a']
p rotate_array(['a']) # == ['a']

# Question 2
# Write a method that can rotate the last n digits of a number.
# Note that rotating just 1 digit results in the original number being returned.
# Recommended:
# You may use the rotate_array method from the previous exercise if you want.

def rotate_rightmost_digits(num, rotate)
  rotate = rotate * -1
  num_array = num.to_s.split(//)
  rotated_arr = []
  if num_array.length > 1
    num_array.each_index do |index|
      next if num_array[index] == num_array[rotate]
      rotated_arr.push(num_array[index])
    end
  end
  rotated_arr.push(num_array[rotate])
  rotated_arr.join.to_i
end

p rotate_rightmost_digits(735291, 1) # == 735291
p rotate_rightmost_digits(735291, 2) # == 735219
p rotate_rightmost_digits(735291, 3) # == 735912
p rotate_rightmost_digits(735291, 4) # == 732915
p rotate_rightmost_digits(735291, 5) # == 752913
p rotate_rightmost_digits(735291, 6) # == 352917

# Question 3
# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining
# digits, you get 329175. Keep the first 2 digits fixed in place and rotate
# again to 321759. Keep the first 3 digits fixed in place and rotate again to
# get 321597. Finally, keep the first 4 digits fixed in place and rotate the
# final 2 digits to get 321579. The resulting number is called the maximum
# rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum
# rotation of that argument. You can (and probably should) use the
# rotate_rightmost_digits method from the previous exercise.

def max_rotation(number)
  num_array = number.to_s.split(//)
  rotation = num_array.length
  loop do
    break if rotation == 1
    number = rotate_rightmost_digits(number, rotation)
    rotation -= 1
  end
  number
end

p max_rotation(735291) # == 321579
p max_rotation(3) # == 3
p max_rotation(35) # == 53
p max_rotation(105) # == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) # == 7_321_609_845

# Question 4
# You have a bank of switches before you numbered from 1 to 1000. Each switch is
# connected to exactly one light that is initially off. You walk down the row of
# switches, and turn every one of them on. Then, you go back to the beginning
# and toggle switches 2, 4, 6, and so on. Repeat this for switches 3, 6, 9, and
# so on, and keep going until you have been through 1000 repetitions of this
# process.

# Write a program that determines how many lights are on at the end, and which
# lights are off.

# Example with 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4.

# With 10 lights, 3 lights are left on: lights 1, 4, and 9.

def divisible(arr, num)
  arr.map!.with_index do |element,index|
    if element == "on" && index % num == 0
      element = "off"
    elsif element == "off" && index % num == 0
      element = "on"
    else
      element
    end
  end
  arr
end

def find_num(arr)
  on_array = []
  arr.each_with_index do |item, index|
    if item == "on"
      on_array.push(index)
    end
  end
  on_array
end

def lights(number)
  arr = [nil]
  number.times {arr.push("on")}
  number = number + 1
  number.times do |iterator|
    if iterator == 0 || iterator == 1
      next
    else
      divisible(arr, iterator)
    end
  end
  p find_num(arr)
end

lights(1000)

# Question 5
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method. You may assume
# that the argument will always be an odd integer.


def diamond(num)
  total = num
  iterator = 1
  until iterator > num
    puts "#{"*" * iterator}".center(total)
    iterator += 2
  end
  loop do
    num -= 2
    break if num < 0
    puts "#{"*" * num}".center(total)
  end
end

diamond(9)

# Question 6
# Write a method that implements a miniature stack-and-register-based programming
# language that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the
#result in the register.
# SUB Pops a value from the stack and subtracts it from the register value,
# storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value,
# storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value,
# storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value,
# storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an
# argument. Your program may assume that all programs are correct programs; that
# is, they won't do anything like try to pop a non-existent value from the stack,
# and they won't contain unknown tokens.

# You should initialize the register to 0.

def string_number?(string)
  string_arr = string.split(//)
  string_num_array = ['-', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  string_arr.each do |item|
    if string_num_array.include?(item)
      return true
    else
      return false
    end
  end
end

def minilang(string)
  stack = []
  register = 0
  string_arr = string.split(" ")
  string_arr.each do |item|
    if string_number?(item)
      register = item.to_i
    elsif item == "PUSH"
      stack.push(register)
    elsif item == "ADD"
      register += stack.pop
    elsif item == "SUB"
      register -= stack.pop
    elsif item == "MULT"
      register *= stack.pop
    elsif item == "DIV"
      register = register / stack.pop
    elsif item == "MOD"
      register = register % stack.pop
    elsif item == "POP"
      register = stack.pop
    elsif item == "PRINT"
      p register
    end
  end
end

minilang('5 PUSH 3 MULT PRINT')
# # 15
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8
minilang('5 PUSH POP PRINT')
# # 5
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # # 12
minilang('-3 PUSH 5 SUB PRINT')
# 8 ------wrong here
minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Question 7
# Write a method that takes a sentence string as input, and returns a new string
# that contains the original string with any sequence of the words 'zero', 'one',
# 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a
# string of digits.

def word_to_digit(phrase)
  numbers = {'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
            'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9}
  phrase_arr = phrase.split(" ")
  phrase_arr.map! do |word|
    if word[-1] == "."
      front = word.chop
      if numbers.keys.include?(front)
        word = numbers[front].to_s + "."
      else
        word
      end
    elsif numbers.keys.include?(word)
      word = numbers[word]
    else
      word
    end
  end
  p phrase_arr.join(" ")
end

word_to_digit('Please call me at five five five one two three four. Thanks.')
# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Question 8
# Write a recursive method that computes the nth Fibonacci number, where nth is
# an argument to the method.

def fibonacci(num)
  if num < 2
    num
  else
    fibonacci(num - 1) + fibonacci(num - 2)
  end
end

p fibonacci(1) # == 1
p fibonacci(2) # == 1
p fibonacci(3) # == 2
p fibonacci(4) # == 3
p fibonacci(5) # == 5
p fibonacci(12) # == 144
p fibonacci(20) # == 6765

# Question 9
# Rewrite your recursive fibonacci method so that it computes its results
# without recursion.

def fibonacci2(num)
  total = 0
  count = 2
  first_num = 1
  second_num = 1
  loop do
    total = first_num + second_num
    first_num = second_num
    second_num = total
    count += 1
    break if count == num
  end
  total
end

p fibonacci2(20) # == 6765
p fibonacci2(100) # == 354224848179261915075
# p fibonacci2(100_001) # => 4202692702.....8285979669707537501

# Qustion 10
# In the previous exercise, we developed a procedural method for computing the
# value of the nth Fibonacci numbers. This method was really fast, computing the
# 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last
# digit of the nth Fibonacci number.

def fibonacci_last(num)
  total = fibonacci2(num)
  total.to_s[-1].to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4