require 'customer'

describe Customer do

	let(:marco) { Customer.new }

	it 'is created with a phone number' do
		marco = Customer.new(phone_number: '+447785181622')
		expect(marco.phone_number).to eq '+447785181622'
	end

	it 'has a default phone number of +447785181622' do
		expect(marco.phone_number).to eq '+447785181622'
	end

	it 'can take a name when created' do
		marco = Customer.new(name: "marco")
		expect(marco.name).to eq "marco"
	end

	it 'the phone number can be changed after created' do
		expect(marco.phone_number = '+447785181678'). to eq '+447785181678'
	end

	it 'can add dishes to a order in the takeaway restaurant' do
		order = double :order
		menu = double :menu
		takeaway = double :takeaway, menu: menu
		quantity = 14
		dish_name = "Burger"
		burger = double :burger

		expect(order).to receive(:add).with(burger, quantity)
  	expect(menu).to receive(:select_a).with(dish_name).and_return(burger)

		marco.add_dishes_to(order, takeaway, dish_name, quantity)
	end

	it 'can place a order after the order is created' do
		order = double :order
		takeaway = double :takeaway
		price_estimate = 14

		expect(order).to receive(:place).with(takeaway, price_estimate)
		marco.place(order, takeaway, price_estimate)
	end
  
end