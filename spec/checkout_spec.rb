require 'Checkout'
   
describe Checkout do
    before(:each) do
	@rules = {:apple => {:quantity => 3, :price => 50, :specialPrice => 30}, :orange => {:quantity => 2, :price => 30, :specialPrice => 15}}
    end
    describe 'apples' do
	it "should be 50 for one apple" do
	    checkout = Checkout.new(@rules)
	    checkout.scan(:apple)
	    checkout.total().should eq 50
	end
	
	it "should be 100 for two apples" do
	    checkout = Checkout.new(@rules)
	    checkout.scan(:apple)
	    checkout.scan(:apple)
	    checkout.total().should eq 100
	end
	
	it "should be 130 for three apples" do
	    checkout = Checkout.new(@rules)
	    checkout.scan(:apple)
	    checkout.scan(:apple)
	    checkout.scan(:apple)
	    checkout.total().should eq 130
	end
    end
    
    describe 'apples and oranges' do
	it "should be 175" do
	    checkout = Checkout.new(@rules)
	    checkout.scan(:apple)
	    checkout.scan(:orange)
	    checkout.scan(:apple)
	    checkout.scan(:orange)
	    checkout.scan(:apple)
	    checkout.total().should eq 175
	end
	
	it "should be 145" do
	    checkout = Checkout.new(@rules)
	    checkout.scan(:apple)
	    checkout.scan(:orange)
	    checkout.scan(:apple)
	    checkout.scan(:orange)
	    checkout.total().should eq 145
	end
    end
end	    
