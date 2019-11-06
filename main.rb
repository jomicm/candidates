# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here

# binding.pry

# pp @candidates

puts "Has experience candidate with id 7?"
puts experienced?(@candidates[1])
puts "Find candidate with id 7"
pp find(7)
puts "Find qualified candidates"
pp qualified_candidates()
puts "Sort candidates by qualifications"
pp ordered_by_qualifications()