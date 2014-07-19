class Customer

	attr_accessor :phone_number

	def initialize(phone_number: '+447785181622')
		@phone_number = phone_number
	end

	def place order, takeaway, price_estimate
		order.place(takeaway, price_estimate)
	end

end