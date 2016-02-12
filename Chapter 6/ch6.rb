# If and it's friends #
# A simple if is writen as
# if condition
 # block of code
# end
# For example
if 10==10
  puts "10 equals 10"
end
# Two more ways to write if in one liner are
x = 20
if x > 10 then puts x end
# Note that you need the then in one liner if
# Another way is to write it with semi-colon
if x > 10; puts x; end
# You can provide an else branch and elsif branch
# An example
print "Enter an integer: "
#n = gets.to_i
n = 12
if n > 0
  puts "Your number is positive."
elsif n < 0
  puts "Your number is negative."
else
  puts "Your number is zero."
end
# You can negate the if using the not keyword or the exlemation mark
if not (x==1)
  puts "x is not one"
end
if !(x==1)
  puts "x is not one"
end
# Note that we put the condition in perenteses. The reason being that we want the
# not or ! to work on the whole condition. If we do if !x==1 it is equivalent to if (!x)==1
# An easier way to write the if not is to use unless. An example
unless x==1
  puts x
end
# unless is equivalent to if not. unless can work with else but there is not
# else unless construct
# For example
unless x ==1
  puts "x != 1"
else
  puts "x equals 1"
end
# if and unless can come at the end of a line as a syntactic suger
# for example
puts x if x > 1
# which is equivalent to
if x > 1
  puts x
end
# and with unless
puts x unless x > 1
# is equivalent to
unless x > 1
  puts x
end
# What is the return value of an if statement.
# If the if is successful it is the last value in the block that was executed. Otherwise
# it is nil. Let's see an example
y =
    if x > 20
      "x is greater than 20"
    end
puts y.nil?
# In this example the if block is not sucessful and hence the return value is null.
# Let's see an example for the case that is success
y =
    if x > 10
      "x is greater than 10"
    end
puts y
# In this case we have y evaluate to the string inside the block of code that was successful
# How about assignment inside a code block. Example
if x = 1
  y = 2
end
puts y
# why y =2. Everything is object in Ruby. x = 1 returns the RHS of the assignment. Every
# object except false and nil are true. So we have if true ...
# Consider the following example
if false
  x = 1
end
p x
# p z
# In this case x is nil! The minute you define a veriable somewhere, even if you never assign it
# it is being created by the Ruby intreptor. In our example, x =1 is never executed, but the
# intrepeter creates x as a palce holder. p z will results in an error because z is unknown.
# Another example
name = "David A. Black"
if m = /la/.match(name)
  puts "Found a match!"
  print "Here's the unmatched start of the string: "
  puts m.pre_match
  print "Here's the unmatched end of the string: "
  puts m.post_match
else
  puts "No match"
end
# Note that /la/.match(name) evalaute to a match object or nil which is false.
# Case statement. Let's look at an example
print "Exit the program? (yes or no): "
answer = "no"
case answer
  when "yes"
    puts "Good-bye!"
    exit
  when "no"
    puts "OK, we'll continue"
  else puts "That's an unknown answer -- assuming you meant 'no'"
end
puts "Continuing with program...."
# Things to note about case statment.
# 1) Only one block will get executed. Once a match is found that blacok win.
# 2) In when we can put multiple matches seperated by comma.
# case answer
#   when "y", "yes"
#     puts "Good-bye!"
#     exit
# etc.
# Behind the scene the case is translated to ifs. So for example, for our example
# It will be translated to
if "yes" === answer
  puts "Good-bye!"
  exit
elsif "no" === answer
  puts "OK, we'll continue"
else
  puts "That's an unknown answer. Assuming no"
end
# Just like if, if there is no match the case evaluates to nil and otherwise to the value
# in the succesful block.

# Repeating actions with loops
# The construct loop, loops for ever. For example. You need to break out of the loop
loop do
  x = x +1
  puts x
  break if x > 20
end
# Without the break we would loop forever!
# Ruby has the while  as well.
n = 1
while n < 10
  puts n
  n += 1
end
# Note the general structure of
# while condition
#   execute something
# end.
# Note that in this case the block of code might not execute even once.
# There is another construct similar to while, begin/while
n = 1
begin
  n += 1
  puts n
end while n < 10
# Note the difference. Note that the code block in begin will be executed at least once!
# You can also use until instead of the while and the name suggest the operation. It essentially
# reverse the logic
n =1
until n > 10
  n +=1
  puts n
end
# Opposed to Java for loop is very specific. It is used to "iterate" over the values
# of an array. The example is as follows
celsius = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
puts "Celsius Fahrenheit"
for c in celsius
  puts "#{c}\t#{ c * 9.0 / 5 + 32}"
end
# We hardly use the for. We will most often use iterators

# Iterators and code blocks. #
# The code block goes hand in hand with the keyword yield. We already saw an example for
# a code block. The loop command takes a code block loop { puts "loop forever"}. The code
# in curly barclet is the code block.
# The loop method has access to the code inside the block: the method can call
# (execute) the block. To do this from an iterator of your own, you use the keyword
# yield. Together, the code block (supplied by the calling code) and yield
# (invoked from within the method) are the chief ingredients of iteration.
# Let's write our own loop
def my_loop
  yield while true
end
# my_loop { puts "My-looping forever!" }
# The yeild keyword is the key here. yield runs the code block supplied to the method.

# Every method call in Ruby has the following syntax:
## A receiver object or variable (defaulting to self if absent)
## A dot (required if there’s an explicit receiver; disallowed otherwise)
## A method name (required)
## An argument list (optional; defaults to ())
## A code block (optional; no default)
# For example
# loop { puts "Hi" }
# loop() { puts "Hi" }
# string.scan(/[^,]+/)
# string.scan(/[^,]+/) {|word| puts word }
# All this examples are valid calls that some takes a code block.

# A code block is either supplied between the do-end pair of keywords or between curly braclets.
array = [1,2,3]
a = array.map {|n| n * 10 }
puts a
a = array.map do
  |n| n * 10
end
puts a

# The times method is an instance method of the Integer class, which means you
# call it as a method on integers. It runs the code block n times, for any
# integer n, and at the end of the method the return value is n.
5.times { puts "Writing this 5 times!" }
#Before we implement times, let’s look at another of its features. Each time times
# yields to its block, it yields something. Sure enough, code blocks, like methods,
# can take arguments. When a method yields, it can yield one or more values.
5.times {|i| puts "I'm on iteration #{i}!" }
# Let's reimplement the times method
class Integer # reopening the class Integer
  def my_times
    c = 0
    until c == self # self is n, so we can compare to self
      yield(c) # yeilding with parameter c
      c += 1
    end
    self # returning n
  end
end
5.my_times {|i| puts "I'm on iteration #{i}!" }

# The idea of each is simple: you run the each method on a collection
# object, and each yields each item in the collection to your code block,
# one at a time. For example
array = [1,2,3,4,5]
array.each {|e| puts "The block just got handed #{e}." }
# The return value of each, when it’s given a block, is its receiver,
# the original array. Our own implementation
class Array
  def my_each
    c = 0
    until c == size # Note that self is added automatically
      yield(self[c]) # Yelding the c-th element of the array
      c += 1
    end
    self
  end
end
# Like each, map walks through an array one element at a time and yields each
# element to the code block. The difference between each and map lies in the return
# value: each returns its receiver, but map returns a new array
array = [1,2,3,4]
a = array.map() {|n| n*10}
p a
class Array
  def my_map
    c = 0
    acc = [] # Initalize accumulator array
    until c == size
      acc << yield(self[c]) # capture return value
      c += 1
    end
    acc # return the new array
  end
end
a = array.my_map() {|n| n*10}
p a
# You’ve seen that block parameters are surrounded by pipes, rather than
# parentheses as method parameters are. But you can use what you’ve learned
# about method arguments to create block parameter lists.
# What about scope? A method definition, as you know, starts a new local scope.
# Blocks are a little more complicated. We will see the rules through a series of examples
def block_scope_demo
  x = 100
  1.times do
    puts x
  end
end
puts block_scope_demo # prints 100. Note that x was defined outside the block but it was
# avilable inside the block.
# Now, what about assigning to the variable inside a block? Again, it turns
# out that the variable inside the block is the same as the one that existed prior
# to the block, as you can see by changing it inside the block and then printing it
# out after the block is finished:
def block_scope_demo_2
  x = 100
  1.times do
    x = 200
  end
  puts x
end
block_scope_demo_2 # prints 200
# Blocks, in other words, have direct access to variables that already exist
# However, block parameters (the variable names between the pipes) behave differently
# from non-parameter variables. If you have a variable of a given name in scope and
# also use that name as one of your block parameters, then the two variables—the one
# that exists already and the one in the parameter list—are not the same as each other.
def block_local_parameter
  x = 100
  [1,2,3].each do |x|
    puts "Parameter x is #{x}" #x is scoped to the block because it was defined in | |
    x = x + 10
    puts "Reassigned to x in block; it's now #{x}"
  end
  puts "Outer x is still #{x}" # x is still 100
end
# Sometimes you may want to use a temporary variable inside a block, even if it isn’t
# one of the parameters being assigned to when the block is called. And when you do
# this, it’s nice not to have to worry that you’re accidentally reusing a variable
# from out- side the block. Ruby provides a special notation indicating that you want
# one or more variables to be local to the block, even if variables with the same name
# already exist: a semicolon in the block parameter list.
def block_local_variable
  x = "Original x!"
  3.times do |i;x|
    x = i
    puts "x in the block is now #{x}"
  end
  puts "x after the block ended is #{x}"
end
block_local_variable







