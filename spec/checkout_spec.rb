require 'shop'

describe Shop do

  before(:all) do
    prices = { "A" => 50, "B" => 30, "C" => 20, "D" => 15 }
    @shop = Shop.new(prices)
  end

  it 'initialize with prices' do

    expect(@shop.prices.size).to eq 4
  end

  describe '#checkout' do
    context 'sums without special offer' do
      it 'when given one item it returns its prices' do

        expect(@shop.checkout("A")).to eq 50
      end

      it 'when given one item it returns its prices' do

        expect(@shop.checkout("B")).to eq 30
      end

      it 'when given two items it returns sum of its prices' do

        expect(@shop.checkout("AB")).to eq 80
      end
    end
    context 'special offer' do
      it 'when given thre items it returns sum of its prices -special offer' do

        expect(@shop.checkout("AAA")).to eq 130
      end

      it 'when given thre items it returns sum of its prices -special offer' do

        expect(@shop.checkout("AAAAAA")).to eq 260
      end

      it 'when given thre items it returns sum of its prices -special offer' do

        expect(@shop.checkout("BB")).to eq 45
      end
    end

    context 'edge cases' do
      it 'returns -1 if wrong string given' do

        expect(@shop.checkout("-B8x")).to eq -1
      end
    end
  end

end
