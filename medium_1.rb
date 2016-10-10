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