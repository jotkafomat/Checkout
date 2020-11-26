class Shop
  PRICES = { "A" => 50, "B" => 30, "C" => 20, "D" => 15 }

  attr_reader :prices

  def initialize(prices = PRICES)
    @prices = prices
  end

  def checkout(string)
    return -1 unless string.match /\A[A-Z]*\z/

    total_price = string.split("")
    .map { |item|
      @prices[item]
    }
    .sum

    total_price - discount_for_a(string) - discount_for_b(string)

  end

  private
  def discount_for_a(string)
    string.count("A") / 3 * 20
  end

  def discount_for_b(string)
    string.count("B") / 2 * 15
  end

end
