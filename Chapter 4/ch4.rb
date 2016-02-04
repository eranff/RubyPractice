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
  def
  report puts "'report' method in module M"
  end
end class C
  include M
end
class D < C
end
obj = D.new obj.report
