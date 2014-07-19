require 'order'

describe 'order' do


	let(:customer) { double :customer          }
	let(:order)    { Order.new(customer)       }
	let(:hotdog)   { double :dish, price: 7.50 }
  let(:burger)   { double :dish, price: 5.50 }

  it 'needs to be created with a customer' do
  	expect(order.customer).to eq customer
  end

  it 'has a dishes list' do
  	quantity = 2
  	order.add(hotdog, quantity)
  	expect(order.dishes_list).to eq [hotdog, hotdog]
  end

  it 'has a array of the prices of the dishes list' do
  	order.add(hotdog, 2)
  	expect(order.price_list).to eq [7.50, 7.50]
  end

  it 'contains the sum of prices of the dishes list'  do
		quantity = 2
  	order.add(hotdog, quantity)
  	order.add(burger, quantity)

  	expect(order.total_price).to eq 26.00
  end

  it 'places a order with the dishes list and a customer estimate price' do
  	quantity = 2
  	order.add(hotdog, quantity)
  	order.add(burger, quantity)
  	takeaway = double :takeaway
  	estimate = 26

  	expect(takeaway).to receive(:place).with(order)
  	expect(order).to receive(:time_now)

  	order.place(takeaway, estimate)
  end

  it 'raises a error if the estimate price is different from the real price' do
  	quantity = 2
  	order.add(hotdog, quantity)
  	order.add(burger, quantity)
  	takeaway = double :takeaway
  	estimate = 10

  	allow(takeaway).to receive(:place).with(order)
  	allow(order).to receive(:time_now)

  	expect{(order.place(takeaway, estimate))}.to raise_error(RuntimeError)
  end

  it 'records the time that the order was placed successfully' do
  	expect(order.time_now).to be_an_instance_of(Time)
  end
end