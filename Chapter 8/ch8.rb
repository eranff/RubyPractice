# A string literal is generally enclosed in quotation marks:
"This is a string."
# Single quotes can also be used:
'This is also a string.'
# But single quoted strings can not use string interpolation
# Like in Java, the basic symbols needs to be scaped. For example, the hashsymbol or
# the backslash symbol.
puts "Backslashes (\\) have to be escaped in double quotes."
puts 'You can just type \ once in a single quoted string.'
puts "But whichever type of quotation mark you use..."
puts "...you have to escape its quotation symbol, such as \"."
puts 'That applies to \' in single-quoted strings too.'
puts 'Backslash-n just looks like \n between single quotes.'
puts "But it means newline\nin a double-quoted string."
puts 'Same with \t, which comes out as \t with single quotes...'
puts "...but inserts a tab character:\tinside double quotes."
puts "You can escape the backslash to get \\n and \\t with double quotes."
# There are other ways to quote a string. %q and %Q, and %. The first creates a single quoted
# string and the second and third double quoted string. The delimiter for the %-style notations
# can be just about anything you want, as long as the opening delimiter matches
# the closing one. Matching in this case means either making up a left/right pair of
# braces (curly, curved, or square) or being two of the same character. Thus all of
# the following are acceptable:
%q-A string- # single quoted string
%Q/Another string/ # double quoted string
%[Yet another string] # double quoted string
# If the charcter that marks the begining and end of the string is used inside the string
# you should escape it.
%q-Better escape the \- inside this string!-
# A “here” document, or here-doc, is a string, usually a multiline string,
# that often takes the form of a template or a set of data lines. Here-docs
# come into being through the << operator, as shown in this irb excerpt:
text = <<EOM
This is the first line of text.
This is the second line.
Now we're done.
EOM
puts text
#The expression <<EOM means the text that follows, up to but not including the next
# occurrence of “EOM.” The delimiter can be any string; EOM (end of message) is a
# common choice. It has to be flush-left, and it has to be the only thing on the
# line where it occurs. You can switch off the flush-left requirement by
# putting a hyphen before the << operator:
text = <<-EOM
The EOM doesn't have to be flush left!
  EOM
# If you want a single- quoted here-doc, put the closing delimiter in single
# quotes when you start the document. To make the difference clearer, this example
# includes a puts of the here-doc:
text = <<-'EOM'
Single-quoted!
Note the literal \n.
And the literal #{2+2}.
EOM
puts text

# In order to get the n-th character from the string we use the {} operator
str = "text"
puts str[2]
puts "great"[2]
# You can use a minus number that will be counted from the left
puts "great"[-2]
# If you provide a second integer argument, m, you’ll get a substring of m
# characters, starting at the index you’ve specified:
puts "Cool language"[5,3]
# You can use a range object as well.
puts "cool language"[5..8]
# You can also grab substrings based on an explicit substring search. If the
# substring is found, it’s returned; if not, the return value is nil:
puts "great cool language"["cool lang"]
puts "great cool language"["very cool lang"] == nil  # evaluate to nil
# The slice method is equivalent to the [] method.
#To set part of a string to a new value, you use the []= method.
# It takes the same kinds of indexing arguments as [] but changes the values
# to what you specify.
string = "Ruby is a cool language."
string["cool"] = "great"
puts string
string[-1] = "!"
puts string
string[-9..-1] = "thing to learn!"
puts string
# To create a new string consisting of two or more strings, you can use the +
# method/operator to run the original strings together. Here’s what irb has to say
# about adding strings:
puts "a" + "b"
puts "a" + "b" + "c"
# To add (append) a second string permanently to an existing string, use the
# << method, which also has a syntactic sugar, pseudo-operator form:
str = "Hi "
str << "there."
puts str
# You can ask a string whether it includes a given substring, using include?.
puts "great language".include? "reat"
puts "great language".include? "cool"
# You can test for a given start or end to a string with start_with? and end_with?:
# The size and length methods (they’re synonyms for the same method) do what
# their names suggest they do:
# If you want to know how many times a given letter or set of letters occurs in a
# string, use count. To count occurrences of one letter, provide that one letter
# as the argument.
# To count how many of a range of letters there are, you can use a hyphen-separated range:
puts "great language".count "g-z"
# You can also provide a written-out set of characters you want to count:
puts "great language".count "ge "
# Another way to query strings as to their content is with the index method.
# index is sort of the inverse of using [] with a numerical index: instead of
# looking up a sub- string at a particular index, it returns the index at which
# a given substring occurs. The first occurrence from the left is returned. If you
# want the first occurrence from the right, use rindex:
puts "cool language".index "oo"
puts "cool language".index "gu"
# strings are compared lexicographically.
puts "a" <=> "c"
# In order to compare strings for their content use == or eql?
# use upcase, downcase and swapcase to create a new string which is upper, lower, and
# swap case of the original string
puts "A new man".upcase
puts "A new man".downcase
puts "A new man".swapcase
# capitalize will capitalize the fisr letter

# Symbols are instances of the built-in Ruby class Symbol. They have a
# literal constructor: the leading colon. You can always recognize a symbol
# literal (and distinguish it from a string, a variable name, a method name,
# or anything else) by this token :
:a
:book
# Symbols are immutable and unique. They are singletons.
puts Symbol.all_symbols[1..5]
# A number of core Ruby methods take symbols as arguments. Many such methods can
# also take strings. You’ve already seen a couple of examples from the attr_* method
# family: attr_accessor :name attr_reader :age
# The send method, which sends a message to an object without the dot, can
# take a symbol:
puts "abc".send(:upcase)
# A hash is a keyed data structure: you insert values into it by assigning the value
# to a key, and you retrieve a value by providing a reference to a key. Ruby
# puts no constraints on hash keys. You can use an array, a class, another hash,
# a string, or any object you like as a hash key. But in most cases you’re likely
# to use strings or symbols. Here’s the creation of a hash with symbols as keys,
# followed by the retrieval of one of the values:
d_hash = { :name => "David", :age => 55 }
puts d_hash[:age]
# And here’s a similar hash with string keys:
d_hash = { "name" => "David", "age" => 55 }
puts d_hash["name"]
# Why use symbols
# Ruby can process symbols faster, so if you’re doing a lot of hash lookups,
# you’ll save a little time.
# symbols look good as hash keys.
# Ruby allows a special form of symbol representation in the hash-key position, with the colon after the symbol instead of before it and the hash separator arrow removed. In other words,
hash = { :name => "David", :age => 55 }
#can also be written as
hash = { name: "David", age: 55 }

# In Ruby, numbers are objects. You can send messages to them, just as you can to any
# object:
n = 99.6
m = n.round
puts m
x = 12
if x.zero?
  puts "x is zero"
else
  puts "x is not zero"
end
puts "The ASCII character equivalent of 97 is #{97.chr}"
# The top class in the hierarchy of numerical classes is Numeric; all the others
# descend from it. The first branch in the tree is between floating-point and integral
# numbers: the Float and Integer classes. Integers are broken into two classes:
# Fixnum and Bignum. Bignums, as you may surmise, are large integers. When you use or
# calcu- late an integer that’s big enough to be a Bignum rather than a Fixnum, Ruby
# handles the conversion automatically for you; you don’t have to worry about it.

# Times and dates are manipulated through three classes: Time, Date, and DateTime. To reap
# their full benefits, you have to pull one or both of the date and time libraries
# into your program or irb session:
require 'date'
require 'time'
# You can get today’s date with the Date.today constructor:
puts Date.today
# You can also create date objects with Date.new (also available as Date.civil).
# Send along a year, month, and day:
puts Date.new(1959,2,1)
# Finally, you can create a new date with the parse constructor, which expects a
# string representing a date:
puts Date.parse("2003/6/9")
# Date.parse makes an effort to make sense of whatever you throw at it, and it’s
# pretty good at its job:
puts Date.parse("November 2 2013")
puts Date.parse("Nov 2 2013")
puts Date.parse("2 Nov 2013")
puts Date.parse("2013/11/2")
puts Date.parse("20160104")
# You can also scan a string against a format specification, generating a Date object,
# with strptime.
# You can create a time object using any of several constructors: new (a.k.a. now), at,
# local (a.k.a. mktime), and parse. This plethora of constructors, excessive though
# it may seem at first, does provide a variety of functionalities, all of them useful.
puts Time.new
puts Time.at(100000000)
puts Time.mktime(2007,10,3,14,3,6)
puts Time.parse("March 22, 1985, 10:35 PM")
# DateTime is a subclass of Date, but its constructors are a little different thanks
# to some overrides. The most common constructors are new (also available as civil),
# now, and parse:
puts DateTime.new(2009, 1, 2, 3, 4, 5)
puts DateTime.now
DateTime.parse("October 23, 1973, 10:34 AM")
# In general, the time and date objects have the query methods you’d expect them to have.
# Time objects can be queried as to their year, month, day, hour, minute, and sec- ond,
# as can date/time objects. Date objects can be queried as to their year, month,
# and day:
dt = DateTime.now
puts dt.year
puts dt.hour
puts dt.minute
puts dt.second
t = Time.now
puts t.month
puts t.sec
d = Date.today
puts d.day
# Some convenient day-of-week methods work equally for all three classes. Through
# them, you can determine whether the given date/time is or isn’t a particular
# day of the week:
d.monday?
#All date/time objects have the strftime method, which allows you to format their
# fields in a flexible way using format strings, in the style of the Unix strftime(3)
# system library:
t = Time.now
puts t.strftime("%m-%d-%y")
# Time objects let you add and subtract seconds from them, returning a new time object:
t = Time.now
puts t
puts t - 20
puts t + 20
# Date and date/time objects interpret + and – as day-wise operations, and they allow
# for month-wise conversions with << and >>
dt = DateTime.now
puts dt + 100
puts dt >> 3
puts dt << 10