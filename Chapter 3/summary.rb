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
    @venue = venue
    @seat = seat
  end
  def venue
    @venue
  end
end
# Note that the initilize method which will be called by the new method will "instantiate" two instance
# veriables venue and seat.
ticket = Ticket.new("MSG", "15F")
puts ticket.venue

# Setter Methods #
# We can create setter methods for every veriable but this might be very non-intatuive. Having something
# like set this or set that. We can use the = sign to create an assignment method.
class Ticket1
  def initialize(venue,seat)
    @venue = venue
    @seat = seat
  end
  def seat=(seat)
    @seat = seat
  end
  def venue=(venue)
    @venue = venue
  end
  def venue
    @venue
  end
end
# We can now easily set the venue/seat veriable by doing equal assignment.
ticket = Ticket1.new("MSG","15F")
ticket.venue = "FH Stadium"
puts ticket.venue
# Note that "setting" the veriable looks like assignment.
# This is a feature of ruby that allows you to end a method name with the equal sign and than calling the method
# Like pure assignment.

# attributes #
# Even now creating a getter takes a three lines. Creating a setter takes three lines. If you have many veriables
# That is a lot of code.
# In order to create a getter, we can define the names of the veriables after an attr_reader
# In order to create a setter, we can define the names of the veriables after an attr_writer
# Let's see an example
class Ticket2
  attr_writer :price
  attr_reader :seat, :venue
end
ticket = Ticket2.new
ticket.price = 100.0
puts ticket.venue
# Note that the name of the veriable is a symbol now. A symbol is like a string but not exactly. It is defined
# by using a colon before the name.
# We can use attr_accessor to create both getter and setter
class Ticket3
  attr_accessor :price, :venue, :seat
end
ticket = Ticket3.new
ticket.price = 100
puts ticket.price

# Inheritence #





