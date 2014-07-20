class Customer

	attr_accessor :phone_number
	attr_reader :name

	def initialize(name: nil, phone_number: '+447785181622')
		@phone_number = phone_number
		@name = name
	end

	def add_dishes_to order, takeaway, dish_name, quantity
		order.add(takeaway.menu.select_a(dish_name), quantity)
	end

	def place order, takeaway, price_estimate
		order.place(takeaway, price_estimate)
	end

end