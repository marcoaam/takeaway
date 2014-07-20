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

  it 'have a orders container empty when created' do
    expect(takeaway.orders).to eq []
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

  it 'can add orders to the order container' do
    takeaway.add(order)
    expect(takeaway.orders).to eq [order]
  end

  it 'records the order after it was placed successfuly' do
    customer = double :customer, phone_number: '+447785181622'
    order = double :order, customer: customer, time: 1208
    allow(takeaway).to receive(:send_sms).with(order.customer.phone_number, takeaway.text_msg(order))
    takeaway.place(order)
    expect(takeaway.orders).to eq [order]
  end

end