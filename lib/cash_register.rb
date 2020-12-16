require 'pry'

class CashRegister
attr_accessor :total, :discount, :cart, :count
attr_reader :price
    
    def initialize(discount = 0)
        @total = 0.0
        @cart = []
        @count = 0
        @discount = discount
    end

    def apply_discount
        @total *= 0.80
        if discount > 0
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def add_item(item, price, quantity = 1)
        hash = {}
        quantity.times do
            hash[item] = price
            @cart << hash
        end
        binding.pry
    end

    def items
        @cart.select {|item, detail| item}
    end


    def void_last_transaction
        @total -= @cart.values.last
        if @cart.empty?
            @total = 0.0
        end
    end
end


x = CashRegister.new
x.add_item("kiwi", 2)
x.add_item("pineapple", 2)
x.add_item("apple", 4, 2)
x.add_item("pepper", 9)
x.add_item("food", 2)
binding.pry