require 'order'
require 'menu'


describe Order do


  describe '#menu' do
    it{is_expected.to respond_to(:menu)}
    it 'shows a list of dishes with prices' do
      expect(subject.menu).to include ({:pizza=>12})
    end
  end

  describe '#select_dish' do
    it{is_expected.to respond_to(:select_dish).with(2).argument}
    it 'selects a dish from a menu' do
      dish = subject.select_dish('pizza', 2)
      expect(subject.selections).not_to be_empty
    end
    it 'raises an error when selection is not valid' do
      expect{subject.select_dish('trash', 3)}.to raise_error 'Selection not valid'
    end
  end
  describe '#breakdown' do
    it 'shows the dish ordered and price based on quantity ordered' do
      subject.select_dish('pizza', 2)
      subject.select_dish('fries', 3)
      expect(subject.breakdown).to include ({:pizza=>24})
    end
  end
end
