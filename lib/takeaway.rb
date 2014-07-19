require_relative 'send_sms'

class Takeaway

	attr_reader :menu

	def initialize(menu)
		@menu = menu
	end

	def add_to(order, dish_name, quantity)
		order.add(menu.select(dish_name), quantity)
	end

	def place(order)
		send_sms(order.customer.phone_number, text_msg(order))		
	end

	def text_msg(order)
		"Thank you for your order, it will be delivered at #{calculate_delivery_time(order)}"
	end

	def calculate_delivery_time(order)
		time = order.time + 3600
		time.to_s.split(" ").[]1
	end

end