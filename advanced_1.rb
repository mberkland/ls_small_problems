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
