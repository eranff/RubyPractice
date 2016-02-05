###### Modules ######
# Module creation #
# A module is a set of methods and constants (and by virue of that local veriables) that can
# be mixed in into a class. More examples later.
# A mdule is created by declaring a block of code to be module. for example
module Test1
  def test1
    puts "I am test1 in a module."
  end
end
# Why modules are important. It allows you to extend a class definition without inheritance. You can inherite from
# one class only and this might interfere with the ability to add more behaviour that are modular. You can mixin
# as many modules as you want.
# The following example is a class that contains module.
class C1
  include Test1
end
c1 = C1.new
c1.test1
# Let's see a bigger example
# Let's create a LIFO stack example
module Stacklike
  def stack
    @stack ||= []
  end
  def add_element(obj)
    stack.push obj
  end
  def remove_element()
    stack.pop
  end
end
class Stack
  include Stacklike
end
# Note that ||= is the operation equal if not nil. So the result is stack will be initialized to an empty array
# if it is nil and otherwise will just return @stack
stack = Stack.new
stack.add_element("test1")
stack.add_element("test2")
puts stack.remove_element
puts stack.remove_element
# We could incoperate the same behaviour into stack, BUT consider the following example
class Cargo
end
class Plain_cargo < Cargo
  include Stacklike
  def plain_number
    7
  end
  # .....
end
# In this example, PlainCargo needs to inheret from Cargo as this makes the most logical sense. The plain cargo is
# LIFO so we can mix in the stacklike and avoid re-implementing the stack operations from scratch.

# Methods search path #
# How do we know which method to call. The search path for a method is very clear. You first look at the class
# for the method with the desired name. If you can find it you look at the modules that were mixed in in a LIFO manner,
# that is the module that was mixed in last is searched first. If not found we are searching in the super class. If
# not found in the modules mixed in for the super class and so on up until BasicObject.
module M
  def report
    puts "'report' method in module M"
  end
end
class C
  include M
end
class D < C
end
obj = D.new
obj.report
# How prepand works. Prepand is similar to include but if you prepered a mixin it will be search before the class for a method
# rather than after the class in the search path for a method. In essence, it elevate the value of the mixin in the search path.
# Another important concent is the super. super calls the same method in the hierarchy
# What is super. In a method if you call super, we are looking in the search path upward for a
# method with the same name, and call it. Example:
module M
  def report
    puts "'report' method in module M"
  end
end
class C
  include M
  def report
    puts "'report' method in class C"
    puts "About to trigger the next higher-up report method..."
    super
    puts "Back from the 'super' call."
  end
end
c = C.new
c.report
# As can be seen from the example, the super resulted in calling report from the mix-in.
# Another example
class Bicycle
  attr_reader :gears, :wheels, :seats
  def initialize(gears = 1)
    @wheels = 2
    @seats = 1
    @gears = gears
  end
end
class Tandem < Bicycle
  def initialize(gears)
    super
    @seats = 2
  end
end
# In this example, we call super with the right information. What parameters are sent with supper
# Called with no argument list (empty or otherwise), super automatically forwards the
# arguments that were passed to the method from which it’s called.
# Called with an empty argument list—super()—super sends no arguments to the higher-up method,
# Called with specific arguments—super(a,b,c)—super sends exactly those arguments.
# even if arguments were passed to the current method.

# The method_missing method. #
# What happens when you called a method that does not exists? ruby has a method called method_missing
# this method is being called whenever you make a call to method that does not exists. Example
o = Object.new
def o.method_missing(m,*x)
  puts "Method #{m} is missing"
end
o.blah
# The method missing receieve as an arguments, the method name as a symbol, and the
# parameters sent to the non-existant function in x.

# In order to facilitate scoping you can define a class inside a module. We
# are accessing the class via the colon accessor. For example,
module M
  class C
  end
end
c = M::C.new
puts c

