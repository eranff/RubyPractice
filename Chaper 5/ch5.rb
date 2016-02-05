#### Self ####
# self is just like this in Java. It refer to the object that is currently being processed
# or used. Self will mean different things in different places.
# Inside the top level program self is main
puts self
# Inside a class self is the class.
class C1
  puts self
end
# Another example
class C2
  puts "Just started class C:"
  puts self
  module M
    puts "Nested module C::M:"
    puts self
  end
  puts "Back in the outer level of C:"
  puts self
end
# inside a method self is the object that holds the method.
class C3
  def x
    puts self
  end
end
c3 = C3.new
c3.x
puts c3
# As can be seen from the example, c3 as self is equal to c3.
# For a singelton method, self is the object that owns the singleton

# self is the default reciver of the messages. What do I mean? If you call a method
# without specifing the object than self is assumed. Example
class C4
  def C4.no_dot
    puts "As long as self is C, you can call this method with no dot"
  end
  no_dot
end
C4.no_dot
# In this example As long ...
# is printed twice. Why? The first no_dot is actually a call for self.no_dot. Since self at
# that point is C4, this is equivalently calling C4.no_dot.
# Another example
class C5
  def x
    puts "This is method 'x'"
  end
  def y
    puts "This is method 'y', about to call x without a dot."
    x
  end
end
c = C5.new
c.y
# Again in this example we do not need to write self.x because if there is no ambiguity
# between a method name and a variable, self will be attached and we will call x from
# inside y.

# A class is an object. Hench it can have object veriable. Look at the following example
class C6
  def show_var
    @v = "I am an instance variable initialized to a string."
    puts @v
  end
  @v = "Instance variables can appear anywhere...."
end
C6.new.show_var
# The result is "I am ..." The reason is that the second @v is a class local veriable.

# Scope #
# Scope is very similar to Java Scope.
# The first scope is global. It is indicated by $ before the veriable name. Once done
# the veriable is avilable EVERY where. Example
$gvar = "I'm a global!"
class C7
  def examine_global
    puts $gvar
  end
end
c = C7.new
c.examine_global
# Ruby has some pre-build global veriables. For example
# $0 is the name of the ruby program
# $: is the searcdh path
puts $0
puts $:

# Local scope is a scope just like any other language.
class C7
  a = 1
  def local_a
    a = 2
    puts a
  end
  puts a
end
c = C7.new
c.local_a
# local scope and self are VERY similar. They differ in a call for recursive call.
# when you make a recurice call to a method the self remain identical but you get new scope.
# Example
class C8
  def x(value_for_a,recurse=false)
    a = value_for_a
    print "Here's the inspect-string for 'self':"
    p self
    puts "And here's a:"
    puts a
    if recurse
      puts "Calling myself (recursion)..."
      x("Second value for a")
      puts "Back after recursion; here's a:"
      puts a
    end
  end
end
c = C8.new
c.x("First value for a", true)
# As you can see in the example, self remains the same, but the scope a new one is generated.

#scope resolution for constants













