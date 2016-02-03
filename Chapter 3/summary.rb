#### Classes and Instances ####
# Classes are here to be instantiated. We already so an example, by doing
obj = Object.new
# we instantiate an object of the class Object
# Classes are methods and veriables grouped together.
# The name of the class is a constant. A constant is a name that starts with capital letter. The following
# is an example for class definition
class Ticket
  def event
    puts "can't do much"
  end
end
# We can create a new ticket using the new method and send a message event to it.
ticket = Ticket.new
ticket.event
# In the previous chapter we endowed a specific instance with a methods. This is called singelton methods
# because they were applied to a single instance. event is an example to instance method because it is
# applicable to all theinstances of a class, in our case the Ticket class.

# You can define and re-define methods the last ne defined is always the one to get executed. For example,
class C
  def m
    puts "First definition"
  end
  def m
    puts "Second definition"
  end
end
c = C.new
c.m # prints Second definition

# class can be reponed and added methods or redefined to achieve certain goals. For example
class X
  def y
  end
end
class X
  def z
  end
end
# In this case this is equivalent to
class X
  def y
  end
  def z
  end
end
# We should rarely open a class is anything. This feature is good if the class definition is spread between files.
# For example. Time is a built in class that we can use in ruby
t = Time.new
puts t
# puts t.xmlschema This is an error because the method xml schema is undefined.
# However, there are extention for the Time class defined in time.rb. So time.rb will open the class,
# add methods that you can use, for example xmlschema and close the class. So
# we can require time.rb and run the command
require 'time'
puts t.xmlschema

# Instance Veriables #
# How do we create veriables that will be bound to the instance of the class and live with it.
# The solution is to mark a veriable, and this could be done everywhere with the @ sign before the veriable name.
# We don't and shouldn't define it in the header. Let' see an example
class Ticket
  def venue
    @venue
  end
  def set_venue(venue)
    @venue = venue
  end
end
# In this example, venue is an instance veriable that we can use in our class definition.

# In the class you can define a method called initalize that will be ran whenever a new
# instance is being created. So for example,
class Ticket
  def initialize(venue,seat)
    @ven
  end
end