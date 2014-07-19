require 'takeaway'

describe Takeaway do


  let(:burger)   { double :dish, name: "Burger", price: 5.50 }
  let(:pizza)    { double :dish, name: "Pizza", price: 7.50  }
  let(:menu)     { double :menu, list: [burger, pizza]       }
  let(:takeaway) { Takeaway.new(menu)                        }
  let(:order)    { double :order                             }

  it 'has a menu list when created' do
  	expect(takeaway.menu.list).to eq [burger, pizza]
  end

  it 'adds the selected dish to the order' do
  	order = double :order
  	dish_name = "Burger"
  	quantity = 2
  	expect(order).to receive(:add).with(burger, quantity)
  	expect(menu).to receive(:select).with(dish_name).and_return(burger)

  	takeaway.add_to(order, dish_name, quantity)
  end

  it 'place order and notifies with sms' do
  	customer = double :customer, phone_number: '+447785181622'
  	order = double :order, customer: customer, time: 1208
  	expect(takeaway).to receive(:send_sms).with(order.customer.phone_number, takeaway.text_msg(order))
  	takeaway.place(order)
  end

  it 'prepares the text to be send in the sms' do
  	order = double :order
  	expect(takeaway).to receive(:calculate_delivery_time).with(order)
  	takeaway.text_msg(order)
  end

  it 'calculates the future delivery time' do
  	order = double :order, time: 1130
  	expect(order).to receive(:time).and_return(1230)
  	takeaway.calculate_delivery_time(order)
  end

end