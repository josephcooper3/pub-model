class Drink

attr_reader(:name, :price, :alcohol_units)

def initialize(name, price, alcohol_units)
    @name = name
    @price = price
    @alcohol_units = alcohol_units
end

end