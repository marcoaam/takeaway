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

	it 'the phone number can be changed after created' do
		expect(marco.phone_number = '+447785181678'). to eq '+447785181678'
	end

	it 'can place a order after the order is created' do
		
	end
  
end