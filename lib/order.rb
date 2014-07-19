class Order

	attr_accessor :dishes_list, :time
	attr_reader :customer

	def initialize(customer)
		@dishes_list = []
		@customer = customer
	end

	def add(dish, quantity)
		quantity.times { dishes_list << dish }
	end

	def total_price
		price_list.inject(:+)
	end

	def price_list
		dishes_list.map { |dish| dish.price }
	end

	def place(takeaway, estimate)
		raise "That is not correct, the total price is #{total_price}" unless estimate == total_price
		@time = time_now
		takeaway.place(self)
	end

	def time_now
		Time.now
	end

end