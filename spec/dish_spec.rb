require 'dish'

describe Dish do

	let(:dish) { Dish.new("Burger", 5.59) }

	it 'is created with a name' do
		expect(dish.name).to eq "Burger"
	end

	it 'is created with a price' do
		expect(dish.price).to eq 5.59
	end
end