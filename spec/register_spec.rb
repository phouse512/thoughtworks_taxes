require_relative '../register'

# to test the validity of our processor, we use the accessor method
# 	get_total to return the price of an item.  Our tests run each of
# 	the possible combinations of basic sales tax as well as import
# 	tax rules
RSpec.describe Register do
  describe '#process_line' do
    it 'should process imported basic sales tax correctly' do
    	register = Register.new()
    	register.process_line("1 imported bottle of perfume at 47.50")
    	expect(register.get_total("1 imported bottle of perfume")).to eq(54.65)
    end

    it 'should process imported exempt sales tax correctly' do
    	register = Register.new()
    	register.process_line("1 imported box of chocolates at 10.00")
    	expect(register.get_total("1 imported box of chocolates")).to eq(10.50)
    end

    it 'should process exempt sales tax correctly' do
    	register = Register.new()
    	register.process_line("1 chocolate bar at 0.85")
    	expect(register.get_total("1 chocolate bar")).to eq(0.85)
    end

    it 'should process regular sales tax correctly' do
    	register = Register.new()
    	register.process_line("1 music CD at 14.99")
    	expect(register.get_total("1 music CD")).to eq(16.49)
    end
  end
end