require 'shop'

describe Shop do

  before(:all) do
    prices = { "A" => 50, "B" => 30, "C" => 20, "D" => 15 }
    @shop = Shop.new(prices)
  end

  it 'initializes with prices' do

    expect(@shop.prices.size).to eq 4
  end

  describe '#checkout' do
    context 'sums prices without special offer' do

      it 'when given one item it returns its price' do

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

      it 'when given three items it returns sum of its prices - special offer' do

        expect(@shop.checkout("AAA")).to eq 130
      end

      it 'when given items on offer x2 it returns sum of its prices -special offer' do

        expect(@shop.checkout("AAAAAA")).to eq 260
      end

      it 'when given items on differnt offer it returns sum of its prices -special offer' do

        expect(@shop.checkout("BB")).to eq 45
      end

      it 'calculate price correctly with all discounts' do

        expect(@shop.checkout("AABAABAABBAB")).to eq 430
      end
    end

    context 'edge cases' do
      it 'returns -1 if wrong string given' do

        expect(@shop.checkout("-B8x")).to eq -1
      end
    end
  end

end
