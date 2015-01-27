class Register
  # sales tax exempt constant - modify as needed
  Exempt = ['book', 'books', 'chocolate', 'chocolates', 'pills', 'pill']

  # register constructor
  def initialize  
    @item_hash = {}
    @tax_hash = {}
  end  
  
  # process line takes a string input from each line
  # of a given text file
  def process_line(line)  
    array = line.split(" ")
    price = array.last
    item = array[0..-3].join(" ")
    @item_hash[item] = price
    self.calculate_tax(item, price)
  end

  # given an item and its price, calculate the given
  # tax for this item
  def calculate_tax(item, price)
    tax = 0.0
    
    # if no words in the item match the exempt list
    if (Exempt - item.split(" ")).length == Exempt.length
      tax += 0.10
    end

    # if imported, add 5% tax
    if item.split(" ").include? 'imported'
      tax += 0.05
    end

    # round up to nearest .05 calculation
    item_tax = price.to_f * tax
    @tax_hash[item] = (item_tax * 20).ceil / 20.0
  end

  # clear the register of any cached data
  def clear_register
    @item_hash = {}
    @tax_hash = {}
  end

  # basic accessor method to grab total price 
  # (including tax) of a given item
  def get_total(item_name)
    return (@item_hash[item_name].to_f + @tax_hash[item_name].to_f).round(2)
  end

  
  # output the current items stored in the register
  def display
    total_tax, total = 0.0, 0.0
    @item_hash.each do |key|
      item_tax, item_price = @tax_hash[key[0].to_s].to_f, @item_hash[key[0].to_s].to_f
      puts "#{key[0].to_s}: %.2f" %  (item_tax + item_price).round(2)
      total_tax += item_tax
      total += (item_price + item_tax).round(2)
    end

    puts "Sales Tax: %.2f" % total_tax.round(2)
    puts "Total: %.2f" % total.round(2)
  end  
end  