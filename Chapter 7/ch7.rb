# Ruby Literals #
# In ruby we usually do XYZ.new to create a new object. There are few exceptions, which are
# instantiated via literals. These constructs are:
# Class | Literal constructor | example
# String | qutation marks | "eran"
# Symbol | leading colon | :symbol
# Array | square brackets | [1,2,3,4]
# Hash | Curly braces | { "eran" => 1, "bing" => "bang"}
# Range | two or three dots | 0..9 or 0...10
# Regex | forward slashes | /([a-z]+)/

# Syntactic Sugar #
# Ruby offers a lot of syntactic sugar in the language. We already saw one where we have a
# method that ends with = we can write name of method = value instead of
# name_of_method=(veribale)
# Another syntactic sugar is the +. If you have a method + defined in your class than you do not
# have to use object.+(variable) but can use directly object + variable
# Example
obj = Object.new
def obj.+(other_obj)
  "Trying to add something to me, eh?"
end
puts obj + 100
# If you defined + method you get for free the += method to add a variable to an object.
class Account
  attr_accessor :balance
  def initialize(amount=0)
    self.balance = amount
  end
  def +(x)
    self.balance += x
  end
  def -(x)
    self.balance -= x
  end
  def to_s
    balance.to_s
  end
end
acc = Account.new(20)
acc -= 5
puts acc
# What if you want to define -obj or +obj. Those are just special methods called +@ and -@.
# for example
class Banner
  def initialize(text)
    @text = text
  end
  def to_s
    @text
  end
  def +@
    @text.upcase
  end
  def -@
    @text.downcase
  end
end
banner = Banner.new("Eat at David's!")
puts banner
puts +banner
puts -banner
# What is we want the object to have logical not, i.e., !. The method name is !. For example
class Banner
  def !
    @text.reverse
  end
end
puts !banner
puts (not banner)

# Some method ends with !. Usually they appear as pairs one method with and one method without.
# i.e., M/M!. When you have a method that ends with !, it usually indicates that the method is
# destructive. Destructive means that usually the object is changed inplace. For example
# str.upcase will create a new str with all the letters upper case.
# If you use str.upcase! str will change directly
str = "Hello"
str.upcase
puts str # Note that str did not change.
str.upcase!
puts str # Note how str did not change.

# to_s is like toString in java.
# to_i and to_f takes a string and creates the integer or float from it. For example
a = "123".to_i
a = "124xyz".to_i
puts a
# Note that altough we had xyz ruby translated the first part to integer. If you want a
# stricter conversion use Integer("number") or Float("number")
# to_str is another way to translate to str. This is going to use in concatation of strings
class Person
  attr_accessor :name
  def to_str
    name
  end
end
david = Person.new
david.name = "David"
puts "david is named " + david + "."
#to_str is what allows for adding the string. Not to_s

# comparing two objects
# There are three methods to compare objects. ==, eql? and equal?
# But there isn’t much point in having three tests that do the same thing.
# Further down the road, in classes other than Object, == and/or eql? are typically
# redefined to do meaningful work for different objects. The equal? method is usually
# left alone so that you can always use it to check whether two objects are exactly
# the same object.
# If you want objects of class MyClass to have the full suite of comparison methods,
# all you have to do is the following:
# 1 Mix a module called Comparable (which comes with Ruby) into MyClass.
# 2 Define a comparison method with the name <=> as an instance method in MyClass.

class Bid
  include Comparable
  attr_accessor :estimate
  def <=>(other_bid)
    if self.estimate < other_bid.estimate
      -1
    elsif self.estimate > other_bid.estimate
      1
    else
      0
    end
  end
end
# The spaceship method B consists of a cascading if/elsif/else statement.
# Depend- ing on which branch is executed, the method returns a negative number
# (by conven- tion, –1), a positive number (by convention, 1), or 0. Those three
# return values are predefined, prearranged signals to Ruby. Your <=> method must
# return one of those three values every time it’s called—and they always mean less
# than, equal to, and greater than, respectively.
bid1 = Bid.new
bid2 = Bid.new
bid1.estimate = 100
bid2.estimate = 105
puts bid1 < bid2

# There are multiple ways to checks for what are the methods that an object react to.
obj = Object.new
puts obj.methods
# There are other similar methods. instance_methods and singelton_methods.




