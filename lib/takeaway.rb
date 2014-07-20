require_relative 'send_sms'

class Takeaway

	attr_reader :menu
	attr_accessor :orders

	def initialize(menu)
		@menu = menu
		@orders ||= []
	end

	def place(order)
		add(order)
		send_sms(order.customer.phone_number, text_msg(order))		
	end

	def add(order)
		orders << order
	end

	def text_msg(order)
		"Thank you! Your order was placed and will be delivered before #{calculate_delivery_time(order)}"
	end

	def calculate_delivery_time(order)
		time = order.time + 3600
		time.to_s.split(" ").[]1
	end

end