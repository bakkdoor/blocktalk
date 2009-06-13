# ***Blocktalk*** #
### **v0.1.5** ###

## **Blocktalk** is a dynamic, object-oriented programming language somewhat in the tradition of Smalltalk and Ruby. ##

It has a syntax familiar to Smalltalk users, but also integrates some syntactic elements from Ruby, 
mainly most literal syntax including literal syntax for blocks, hashes, arrays, symbols and regular expressions.
In contrast to Ruby, there are only very few predefined keywords in the language, everything else is achieved via
methodcalls on objects, similar to how it is done in Smalltalk.


### Class definitions ###

For example, defining classes and modules in Blocktalk is also done via methodcalls to the Class and Module class
respectively:

    Class >> :Foo do
	    def bar = do |baz|
	      Console puts: "In Foo#bar with baz = #{baz}"
    	end
    end

Here, the ">>" method is called on the Class class (which also is an object - a class object), which takes the name
of the class as a Symbol and then a codeblock that gets evaluated in the context of the class. This can be done in Ruby
as well (in a similar way via `Class#new`, but in contrast to Ruby, this is the only way to do it.
In Smalltalk you would do it in a similar way: `Superclass subclass: Foo`.


### Codeblocks ###

As in Ruby & Smalltalk, Blocktalk supports literal syntax for codeblocks (anonymous blocks of code / closures).
In contrast to Ruby, there's is no conceptual difference between codeblocks passed to methods as part of a method call
and storing them into variables - the syntax is the same. In Ruby you'd have to deal with converting blocks to Procs
and vice versa.
In constrast to Smalltalk, Blocktalk supports implicit passing of codeblocks to methods as it is done in Ruby. However,
since the syntax for an implicit codeblock passed to a method and creating them explicitly (to be stored in a variable or
or method argument, for example) is the same, you can also use the Smalltalk-ish approach of passing in codeblocks to
methodcalls explicitly as arguments. 
This is also used in a few predefined methods in the standard library. An example is the if_true:if_false method, that
can take two explicit codeblocks for a if and then part, or just a block for the if part (either explicitly as an argument
or implicitly as a ruby-like method call with a passed in block):

    (a < b) if_true: {
	    Console print: "a smaller than b!"
    } if_false: {
	    Console print: "a greater than b!"
    }

Since Blocktalk supports a very easy literal syntax for codeblocks, many special keywords aren't needed (as in Smalltalk).
The example above shows, how a typicall if-then conditional could be written.

Another example would be a while loop:

    i = Console gets: "Please enter a number!" to_i
    {i < 10} while_true {
	    Console print: "a smaller than b!"
	    i = Console gets: "Enter again!" to_i
    }

In this case, while_true takes a ruby-like implicit block, noticeable by the absence of the colon after the methodname,
which indicates a method call with a passed in argument.


### Exception Handling ###

Exception handling in Blocktalk is done similar to most programming languages, including Ruby:


    i = Console gets: "Please enter a number!"
    try {
	    Console print: "10 / i = #{(10 / (i to_i))}"
   
	    catch: ZeroDivisionError do |ex|
	      Console print: "got a exception: #{ex message}"
	    end

	    ensure {
	      Console print: "this will get done, no matter what value i has!"
	    }
    }

This example will obviously fail if the we enter a zero. As in Ruby, the ensure-block gets run independent of an error
being raised or not (similar to e.g. `finally` in Java). 


### Other features ###

As Blocktalk is still in heavy development, new features may be added or old ones redesigned - I'm very open to discussion
if anyone has some cool ideas, just let me know.


## Current status ##

I have most of the basic features done, Including Class & Module definitions (with class & instance methods etc), most
literal syntax (Integers, Floats, Symbols, Hashes, Arrays, Codeblocks, Regular Expressions ...) and a *working* interpreter
written in Ruby, that actually is somewhat of a compiler. As of now, the code gets parsed and translated into (quite ugly)
Ruby code, which then gets fed into Ruby and executed. I know this isn't the best way for now probably, but it works.
Something I'd like to add in the future is a bytecode compiler for Ruby 1.9.


## Implementation ##

Blocktalk is implemented in Ruby. The goal is to be able to run any Ruby code available, making it easy to get something
real and working fast.
Another goal is to add some more unique features, that Ruby for example does not support. I'm very open for ideas on this.


## Dependencies ##

- Treetop ([http://treetop.rubyforge.org](http://treetop.rubyforge.org)) for the parser.

- That's it for now :)

#### (C) 2009 Christopher Bertels / [http://www.adztec-independent.de](http://www.adztec-independent.de) ####
