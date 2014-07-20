class Menu

	attr_accessor :list

	def initialize
		@list = []
	end

	def add(dish)
		list << dish
	end

	def select_a(dish_name)
		list.select { |dish| dish.name == dish_name }.first
	end

end