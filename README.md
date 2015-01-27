Usage Instructions
==================

To actually run the text file processor on the given inputs, you
can use the text_processor.rb file on the input files given in 
the input folder.  You can run as follows in a Unix environment:

	ruby text_processor.rb input/input.txt

To run the unit tests on the Register class itself (the portion
of code that handles tax calculations and price storing), you
can run the following command:

	rspec spec

If you do not have rspec installed, it is simply a Ruby gem and
you can install with:

	gem install rspec


Design Decisions
----------------

The biggest decision I had to make involved where to store the 
logic for processing transactions, from reading from a text file 
to calculating tax for a given item.

One of the biggest decisions I made was to decouple the 'reading 
input' action from the 'process price' action.  In the real world,
input could come from a lot of things (HTTP requests, data store,
physical register, etc.) and I wanted to build a class that would
be robust to handle input from different sources.  The Register
class that I built has a few methods, process_line, calculate_tax,
clear_register, etc, and these all move towards handling the actions
of an actual register.  

I wrote text_processor.rb as just a simple example of how input from
text files might be loaded into a register.  The tests I wrote using
Rspec are not comprehensive unit tests of the entire class, but they
test the combinations of different tax rules based on given items.

In the Register class itself, I decided to store the item price
and tax separate in two different hash maps that allow you to access
the price and tax for a given item separately. This allows for a more
easy total tax calculation, and in real-world scenarios there are
times when having these separately stored would be important.
