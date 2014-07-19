require 'menu'

describe Menu do

	let(:menu) { Menu.new }

  it 'have a menu list with dishes empty at the beginning' do
  	expect(menu.list).to eq []
  end

  it 'can take dishes inside the list' do
  	burger = double :dish, name: "Burger", price: 5.65
  	menu.add(burger)
  	expect(menu.list).to eq [burger]
  end
end