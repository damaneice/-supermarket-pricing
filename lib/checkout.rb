class Checkout

    def initialize rules
	@items = {}
	@rules = rules
     end
    
    def scan item
	if @items[item].nil?
	    @items[item] = 0
        end 
	@items[item] = @items[item] + 1		
    end
    
    def total
	price = 0
	@items.each_pair do | item, qty |
	    (1..qty).each do | i | 
	        price = price + determinePrice(item, i) 
	    end
	end
	return price
    end

    private 
    def determinePrice item, qty
	return @rules[item][:specialPrice] if qty % @rules[item][:quantity] == 0
	@rules[item][:price]	
    end 

end
