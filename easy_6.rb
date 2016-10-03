# Question 1
# Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a String that represents that angle in
# degrees, minutes, and seconds. You should use a degree symbol (˚) to represent
# degrees, a single quote (') to represent minutes, and a double quote (") to
# represent seconds. There are 60 minutes in a degree, and 60 seconds in a minute.

def dms(angle)
  degrees = angle.to_i
  minutes_and_seconds = (angle - degrees) * 60
  minutes = minutes_and_seconds.to_i
  seconds = (minutes_and_seconds - minutes) * 60
  seconds = seconds.round
  if seconds == 60
    minutes += 1
    seconds = 0
  end
  if minutes == 60
    minutes = 0
    degrees += 1
  end
  if minutes < 10
    minutes = "0#{minutes}"
  end
  if seconds < 10
    seconds = "0#{seconds}"
  end
  puts "#{degrees}*#{minutes}'#{seconds}"
end

dms(30) #== %(30°00'00")
dms(76.73) # == %(76°43'48")
dms(254.6) # == %(254°36'00")
dms(93.034773) # == %(93°02'05")
dms(0) # == %(0°00'00")
dms(360) # == %(360°00'00") || dms(360) == %(0°00'00")

# Question 2
# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.

def remove_vowels(arr)
 arr.map do |word|
   word.gsub!(/[aeiou]/i, ' ')
   word.delete(' ')
  end
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) # == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) # == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) # == ['BC', '', 'XYZ']

# Question 3
# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument. (The first
# Fibonacci number has index 1.)

def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

p find_fibonacci_index_by_length(2) # == 7
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) # == 476
p find_fibonacci_index_by_length(1000) # == 4782
p find_fibonacci_index_by_length(10000) # == 47847

# Question 4
# Write a method that takes an Array as an argument, and reverses its elements
# in place; that is, mutate the Array passed in to this method. The return value
# should be the same Array object.

# You may not use Array#reverse or Array#reverse!.
def reverse!(list)
  initial_length = list.length
  iterator = (list.length - 1)
  while iterator >= 0
    list << list[iterator]
    iterator -= 1
  end
  iterator2 = 0
  until iterator2 == initial_length
    list.delete_at(0)
    iterator2 += 1
  end
  p list
end


list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list.object_id
p result.object_id

# Question 5
# Write a method that takes an Array, and returns a new Array with the
# elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you
# wrote in the previous exercise.

def reverse(arr)
  reverse_array = []
  arr.each do |item|
    reverse_array.unshift(item)
  end
  p reverse_array
end


reverse([1,2,3,4]) # == [4,3,2,1]
reverse(%w(a b c d e)) # == %w(e d c b a)
reverse(['abc'])  #== ['abc']
reverse([]) # == []

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
p list.object_id
p new_list.object_id  # => true
p list # == [1, 2, 3]                     # => true
p new_list # == [3, 2, 1]                 # => true

# Question 6
# Write a method that takes two Arrays as arguments, and returns an Array that
# contains all of the values from the argument Arrays. There should be no
# duplication of values in the returned Array, even if there are duplicates in
# the original Arrays.

def merge(arr1, arr2)
  arr1 | arr2
end

p merge([1, 3, 5], [3, 6, 9]) # == [1, 3, 5, 6, 9]

# Question 7
# Write a method that takes an Array as an argument, and returns two Arrays that
# contain the first half and second half of the original Array, respectively.
# If the original array contains an odd number of elements, the middle element
# should be placed in the first half Array.

def halvsies(arr)
  halvsies_arr1 = []
  halvsies_arr2 = []
  halves = arr.length / 2
  arr.length % 2 == 0 ? halves -= 1  : halves
    arr.each_with_index do |item, index|
      if index <= (halves)
        halvsies_arr1.push(item)
      else
        halvsies_arr2.push(item)
      end
    end
  [halvsies_arr1, halvsies_arr2]
end


p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) # == [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]

# Question 8
# Given an unordered array and the information that exactly one value in the
# array occurs twice (every other value occurs exactly once), how would you
# determine which value occurs twice? Write a method that will find and return
# the duplicate value that is known to be in the array.

def find_dup(arr)
  arr.each do |item|
    item_count = arr.count(item)
    return item if item_count > 1
  end
end

p find_dup([1, 5, 3, 1]) # == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) # == 73

# Question 9
# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the array,
# false if it is not. You may not use the Array#include? method in your solution.

def include?(arr, include_item)
  arr.each { |item| return true if item == include_item }
  false
end

p include?([1,2,3,4,5], 3) # == true
p include?([1,2,3,4,5], 6) # == false
p include?([], 3) # == false
p include?([nil], nil) # == true
p include?([], nil) # == false

# Question 10
# Write a method that takes a positive integer, n, as an argument, and displays
# a right triangle whose sides each have n stars. The hypotenuse of the triangle
# (the diagonal side in the images below) should have one end at the lower-left
# of the triangle, and the other end at the upper-right.

def triangle(num)
 spaces = num - 1
 count = 1
 loop do
  puts " " * spaces + "*" * count
  spaces -= 1
  count += 1
  break if count == num + 1
 end
end

triangle(5)
triangle(9)
#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********