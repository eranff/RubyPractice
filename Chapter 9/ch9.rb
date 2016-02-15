# You can create an array in one of four ways:
## With the Array.new method
## With the literal array constructor (square brackets)
## With a top-level method called Array
## With the special %w{...} and %i{...} notations
#The new method on the array class works in the usual way:
a = Array.new
# a is now an empty array.
a = Array.new(3)
p a
# a is now an array with three elements that are all nil
a = Array.new(3, Object.new)
p a
# a is now a three elements array with all the elements initalized to the object that we
# supplied on the constructor.
# You can even supply a code block to Array.new. In that case, the elements of the
# array are initialized by repeated calls to the block:
n = 0
a = Array.new(3) { n += 1; n * 10 }
p a
# The second way to create an array is by using the literal array constructor []
# (square brackets):
a = []
# When you create an array with the literal constructor, you can put objects into the
# array at the same time:
a = [1,2,"three",4, []]
# Notice that the last element in this array is another array. That’s perfectly legitimate;
# you can nest arrays to as many levels as you wish.
# The third way to create an array is with a method (even though it looks like a
# class name!) called Array.
# The Array method creates an array from its single argument. If the argument object has
# a to_ary method defined, then Array calls that method on the object to generate an array.
# (Remember that to_ary is the quasi-typecasting array conversion method.) If there’s no
# to_ary method, it tries to call to_a. If to_a isn’t defined either, Array wraps the
# object in an array and returns that
string = "A string"
puts string.respond_to?(:to_ary)
puts string.respond_to?(:to_a)
p Array(string)
def string.to_a
  self.split(//)
end
p Array(string)
# To set an array element you use the []= method. However, due to syntactic sugar this is done
# via the easy to use array[n]=y where n is the element we want to set and y is the value
a = []
a[0] = "first"
p a
# In order to get an element we are using the [] method whose syntactic sugar is array[n].
a = [1,2,3,4,5]
p a[2]
# If you need more than one element from the array you can use [n,m] to retrive the m
# elements starting from n. Example
p a[1,2]
# You can use a similar syntacs for setting more than one elements
a[1,2] = [11,12]
p a
# Another important method is value_at which returns the elements in the indexes that we
# provide the method with
p a.values_at(0,2,4)
# To add an element at the begining of the array you should use unshift with the element
# that you want to add at the begining
a.unshift(-1)
p a
# To add an element at the end you can use the push method. The << method offers a similar
# ability
a.push(100)
p a
a << 200
p a
# The methods << and push differ in that push can take more than one argument. The code
a = [1,2,3,4,5]
a.push(6,7,8)
p a
# adds thres elements at the end.
# shift and pop remove an element from the begining (end) of the array
p a
a.pop
p a
a.shift
p a
# shift and pop can remove more than one element at a time. Just provide an integer
# argument, and that number of elements will be removed. The removed items will be
# returned as an array
# To add the content of one array to another you can use concat. concat permanently changes the contents of
# its receiver.
a = [1,2,3]
a.concat([4,5,6])
p a
# If you want to combine two arrays into a third, new array, you can do so with the + method
a = [1,2,3]
b = [4,5,6]
c = a + b
p a
p c
# A useful array transformation is flatten, which does an un-nesting of inner arrays.
# You can specify how many levels of flattening you want, with the default being the
# full un-nesting.
array = [1,2,[3,4,[5],[6,[7,8]]]]
p array.flatten
p array.flatten(1)
p array.flatten(2)
# Another array-transformation method is reverse, which does exactly what it says
# Another important array-transformation method is join. The return value of join
# isn’t an array but a string, consisting of the string representation of all the
# elements of the array strung together:
p ["abc", "def", 123].join(", ")
# Other methods that notice
a.size
a.length
a.empty?
a.include?("qw")
a.count(2)
a.first(n=1)
a.last(n=1)

# Hashes
# Hashes are like LinkedHashMap in Java
# A hash consists of key/value pairs, where any key and any value can be any Ruby object.
# Hashes let you perform lookup operations based on keys. In addition to simple key-based
# value retrieval, you can also perform more complex filtering and selection operations.
state_hash = { "Connecticut" => "CT", "Delaware" => "DE",
               "New Jersey" => "NJ", "Virginia"=> "VA" }
state = "New Jersey"
abbr = state_hash[state]
puts "The abbreviation is #{abbr}."
# Hashes remember the insertion order of their keys. Hashes remember their key-insertion
# order and observe that order when you iterate over them or examine them
# When you type out a literal hash inside curly braces, you separate keys from
# values with the => operator (unless you’re using the special { key: value }
# syntax for symbol keys). After each complete key/value pair you put a comma
# (except for the last pair, where it’s optional)
h = {}
# Another way of creating an empty hash is to use the Hash.new method
h = Hash.new
# In order to add an element to the has use the []= method. This could be done, via directly
# or syntactic sugar methods.
h.[]=("New York", "NY")
h["New Jersey"] = "NJ"
# Both methods are legit but the second one is the one to use.
# To retrive a value from the has use the [] method
h.[] "New York"
h["New York"]
# You can also retrieve values for multiple keys in one operation, with values_at:
p h.values_at("New York", "New Jersey")
# By default, when you ask a hash for the value corresponding to a nonexistent key, you
# get nil. But you can specify a different default value by supplying an argument to
# Hash.new or the default method on existing hash
h.default = "UNK"
p h["Mexico"]
h = Hash.new(0)
# Hash .new can take a block of code that we can use to generate a more clever default.
# The code will be called whenever the key does not exists.
h = Hash.new { |hash, key| hash[key] = "Go Fish: #{key}" }
p h["test"]
# The update method update the first hash with the elements from the second has. In case
# of collissions the second has wins.
h1 = {
    "John" => "smith",
    "Eran" => "Fishler"
}
h2 = {"John" => "Jim"}
h1.update h2
p h1
# Note that the operation is distructive for h1. The elements in h1 are replaced.
# You can combine the two hashes using merge and the result is a third hash. i.e., the
# operation is not distructive to either has.
h1 = {
    "John" => "Smith",
    "Eran" => "Fishler"
}
h2 = {"John" => "Jim"}
p h1.merge(h2)
p h1
# reject and select operate to allow you select and reject elements from the hash. They
# both take a code block.
h = Hash[1,2,3,4,5,6] # Note that we instantiate the has with an array, which is legit.
# Every pair of elements will be key/value
p h.select {|k,v| k > 1 }
p h.reject {|k,v| k > 1 }
# invert flips the keys and the values. Values become keys, and keys become values.
# Be careful when you invert hashes. Because hash keys are unique, but values aren’t,
# when you turn duplicate values into keys, one of the pairs is discarded
# Hash have few methods that are useful
h.has_key?(1)
h.include?(1)
h.has_value?(2)
h.empty?
h.size
# If you call a method in such a way that the last argument in the argument list is a
# hash, Ruby allows you to write the hash without curly braces. This perhaps trivial-
# sounding special rule can, in practice, make argument lists look much nicer than
# they otherwise would.

# Ranges
# You create a range object with Range.new(X,Y) or with two or three dots
r = Range.new(1,5)
p r
r = 1..5
r = 1...5
# If you use the two dots notation than the range is isnclusive of the right argument, and if
# you use three dots the range is exclusive of the right argument.
# few good methods to know
p r.begin
p r.end
p r.exclude_end?
# The cover method checks whether the argument is "covered" by the range. cover essentially
# is two ifs. argument >= begin and argument < (<=) end if the range is exclusive (inclusive)
r = "a".."z"
p r.cover?("abc") # true
# Note that a >= "abc" and "abc" <= "z"
p r.cover?("A") # false
# The include? test treats the range as a kind of crypto-array—that is, a collection of
# values. The "a".."z" range, for example, is considered to include (as measured by
# include?) only the 26 values that lie inclusively between "a" and "z".
# In cases where the range can’t be interpreted as a finite collection, such as a
# range of floats, the include? method falls back on numerical order and comparison:
r = 1.0..2.0
p r.include?(1.5) # true

# Set
# Set is not built in class but a standard library class. You need to require it in order
# to work with it.
require 'set'
# Set is like a HashSet in Java.
# To create a set, you use the Set.new constructor. You can create an empty set,
# or you can pass in a collection object (defined as an object that responds to each or
# each_entry). In the latter case, all the elements of the collection are placed
# individually in the set.
new_england = ["Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont"]
state_set = Set.new(new_england)
# You can also provide a code block to the constructor, in which case every item in the
# collection object you supply is passed through the block (yielded to it) with the
# resulting value being inserted into the set. For example, here’s a way to initialize
# a set to a list of uppercased strings
state_set = Set.new(new_england) do |elem|
  elem.upcase
end
p state_set
# In order to add an element to the set use the << operator. In order to delete an item use the
# delete method. Deleting object that is not in the set or add an element that is already in
# the set do not raise an error.
# Set has a couple of operations that we can use.
## intersection, aliased as &
## union, aliased as + and |
## difference, aliased as -
# Each of these methods returns a new set consisting of the original set, plus or minus
# the appropriate elements from the object provided as the method argument
# You can use a merge command to merge an object. The object will be iterated and all the
# elements of this iteration will be added to the set. If the object is not enumerable
# we will simple add the object.
s = Set.new([1,2,3])
s.merge({ "New Jersey" => "NJ", "Maine" => "ME" })
p s





