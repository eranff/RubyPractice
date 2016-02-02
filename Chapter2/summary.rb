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
puts result

