# Question 1
# ake a madlibs program that reads in some text from a text file that you have
# created, and then plugs in a selection of randomized nouns, verbs, adjectives,
# and adverbs into that text and prints it. You can build your lists of nouns,
# verbs, adjectives, and adverbs directly into your program, but the text data
# should come from a file or other external source. Your program should read this
# text, and for each line, it should place random words of the appropriate types
# into the text, and print the result.

# The challenge of this program isn't about writing your program; it's about
# choosing how to represent your data. Choose the right way to structure your
# data, and this problem becomes a whole lot easier.
NOUN = ["dog", "cat", "bird", "rabbit", "skunk", "chipmunk", "donkey"]
VERB = ["runs", "saunters", "grabs", "growls", "shrinks", "laughs"]
ADVERB = ["gingerly", "tensely", "tersely", "lightly", "quietly", "noisely"]
ADJECTIVE = ["large", "red", "fiersome", "magenta", "tiny", "crazy", "silly",
              "noisey", "sloppy", "prissy"]


File.open("madlibs.txt").readlines.each do |line|
    puts format(line,   noun: NOUN.sample,
                        verb: VERB.sample,
                        adverb: ADVERB.sample,
                        adjective: ADJECTIVE.sample)
end

# Question 2
# Write a method that displays an 8-pointed star in an nxn grid, where n is an
# odd integer that is supplied as an argument to the method. The smallest such
# star you need to handle is a 7x7 grid.

def star(odd_int)
  number_of_lines = (odd_int - 7) / 2 + 2
  num_range = (1..number_of_lines).to_a
  num_range.reverse_each do |num|
    puts "#{"*"}#{" " * num}#{"*"}#{" " * num}#{"*"}".center(odd_int)
  end
  puts "#{"*" * 3}".center(odd_int)
  puts "#{"*" * odd_int}"
  puts "#{"*" * 3}".center(odd_int)
  num_range.each do |num|
    puts "#{"*"}#{" " * num}#{"*"}#{" " * num}#{"*"}".center(odd_int)
  end
end

puts " "
star(7)
puts " "
star(15)

# for star(7)
# *  *  *
#  * * *
#   ***
# *******
#   ***
# * * *
# *  *  *

# Question 3
# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns
# the transpose of the original matrix. Note that there is a Array#transpose
# method that does this -- you may not use it for this exercise. You also are
# not allowed to use the Matrix class from the standard library. Your task is to
# do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and
# leave the original matrix unchanged.

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]


def transpose(matrix)
  index_arr = [0, 1, 2]
  new_matrix = []
  index_arr.each do |index|
    new_matrix.push([matrix[0][index], matrix[1][index], matrix[2][index]])
  end
  p new_matrix
end

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Question 4
# n the previous exercise, you wrote a method to transpose a
# 3 x 3 matrix as represented by a ruby Array of Arrays.

# Matrix transposes aren't limited to 3 x 3 matrices, or even
#  square matrices. Any matrix can be transposed by simply
# switching columns with rows.

# Modify your transpose method from the previous exercise so
# it works with any matrix with at least 1 row and 1 column.

def transpose(matrix)
	transposed_array = []
	temp_array = []
	counter = 0
	loop do
		matrix.each do |array|
			temp_array.push(array[counter])
		end
		transposed_array.push(temp_array)
		temp_array = []
		counter += 1
		break if counter == matrix[0].length
	end
	p transposed_array
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]