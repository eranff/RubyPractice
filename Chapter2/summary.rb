# We create an object with the new keyword
test = Object.new
# In ruby we can add methods on the fly. Assume we want the object test to react to the talk command. Then we can easily add this to test.
def test.talk
  puts "tests"
end
# Now test can react to the talk command
test.talk # prints tests
#If we want the method to take an argument we need to add this list into the object definition
# for example
def test.c2f(c)
  c * 9.0 / 5 + 32
end
# now send to test with 100 and get 212
puts test.c2f(100)
# The perantces are optional.
puts test.c2f 100
# The return method is optional. In general ruby return the result of the last operation.
# For example as in the c2f method. However the following version is just as good
def test.c2fv2(c)
  return c * 9.0 / 5 + 32
end
puts test.c2fv2 100
# The return type is necessary when we want to return more than one veriable
def test.c2fv3(c)
  return c, c * 9.0 / 5 + 32
end
# When we return a multiple values the result is wrapped in an array. So results for the following call
result = test.c2fv3 100
# is an array.
# One can easily wrap the results directly in an array and thanthe array will
# be returned without a need for the return keyword. For example,
def test.c2fv4(c)
  [c, c * 9.0 / 5 + 32]
end
result = test.c2fv4 100 # result is an array

####
# A nice feature in ruby is string interpulation. We can write inside a string the combination #{ruby code} and
# the ruby code will be evaluated andprinted with the string. For example
puts "The temprature is #{test.c2f 100} F."
# In ruby we have true and false object. nil is considered a false. EVERY operation in ruby returns an object.
# Sometimes this object is nil. For example, puts return nil. Example
def test.avilable?
  true
end
if test.avilable?
  puts "test is true."
end
# In ruby every object is true except the false and nil objects.
if (test)
  puts "test is true"
end

#### The inate behavior of an object ####
# Every object is created with some methods. If you want to see the methods call the method methods
test = Object.new
puts test.methods
# Look at all this methods!!!
# Let's look at some of them. object_id provide the id of the object. So for example
puts test.object_id
# If test2 point to the same object they are going to have the same object id. For example
test2 = test
puts "Test 1 object id: #{test.object_id} and test2 object id: #{test2.object_id}"
# Both test and test2 are reference to the same object and hence they are identical.
# Note the following example about strings
test1 = "Hello"
test2 = "Hello"
puts "test1 object id: #{test.object_id} and test2 object id: #{test2.object_id}"
# They are NOT the same. Ruby do not cache strings.# The next built in method is the respond_ro?
# Consider the following example
test = Object.new
# If we try to call test.talk on the object we will get an exception because talk is not defined. We can check it
# via the respond to method. For example
if test.respond_to? "talk"
  puts "test responds to talk"
else
  puts "test does not respond to talk"
end
# Last but not list is send. Suppose you have the following object
def test.price
  5.5
end
def test.venue
  "pub"
end
def test.date
  "1/1/2001"
end
# Suppose the user can query any of the fields. He enter on the command line the "method" he wants. In this
# a common method is to write long if else to see what the user requested. For example
input = "price"
if input == "price"
  puts test.price
elsif input == "venue"
  puts test.venue
elsif input == "date"
  puts test.date
end
# It is easier to use send
puts test.send input
# Note that send might be overwritten by a user, so use __send__ instead. This by convention is never overwrittem
puts test.__send__ input

#### Close look at method arguments ####
# In ruby you have required, optional and default argument.
# A required argument
obj = Object.new
def obj.one_argument(x)
  puts "I need one argument"
end
# If you try obj.one_argument(1,2,3) you will get an exception
# It is possible to write a method that takes zero or more argument using the following
def obj.zero_or_more_args(*x)
  puts "I take zero or more arguments"
  p x
end
# In this case x is an array with the inputs
# so for example
obj.zero_or_more_args()
obj.zero_or_more_args(1)
obj.zero_or_more_args(1,2,3)
# What if you have two required arguments and than an unknown number of arguments. You can use
def obj.two_or_more_arg(a,b,*x)
  puts "I require two or more arguments"
  p a,b,x
end
# And for example
obj.two_or_more_arg(1,2)
obj.two_or_more_arg(1,2,3)
obj.two_or_more_arg(1,2,3,4)
# What if you have default argument. The following is an example
def obj.one_default_arg(a,b,c=1)
  puts "I have default argument"
  p a,b,c
end
# And as an example
obj.one_default_arg(1,2)
obj.one_default_arg(1,2,3)
# Ruby is smart. You can do something like
def obj.ex1(a,b,*c,d)
  puts "example 1"
  p a,b,c,d
end
# In this case what ruby will try to do is bound the variable from the left up till the sponge veriable
# *c and then will assign the veriables from the left and what remain will go to the spong array.
obj.ex1(1,2,3)
# In this case 1 ->a 2-> b 3->d and c is empty
obj.ex1(1,2,3,4)
# In this case 1 ->a 2-> b 4->d and c is [3]
obj.ex1(1,2,3,4,5)
# In this case 1 ->a 2-> b 5->d and c is [3,4]
# In ruby the parameters assigned first to the left, than from the right and lastly to the spong. You can have only one sponge
# parameter in your argument list

#### Local Veriables ####
# Local veriables starts with lower case letter or underscore.
# Local veriables are scope bound. Keep in mind, Ruby supports closures!!!! So the following is legit.
x = 5
def obj.test1()
  puts "x = #{x}"
end
obj.test1
# If you want to protect your object and you want to prevent it from being changed you can use the the dup.
obj.dup # creates a duplicate object that if changed will not be reflected on the original object.
# There is another method called freeze. If you frezze an object NO ONE can change it. You can not unfreeze and object. 















































