class Coin < ApplicationRecord
  has_many :deals, dependent: :restrict_with_exception 
  validates :title, presence: true, length: { minimum: 3 }
  validates :ticker, presence: true

  def sum_amount
    sum_amount = 0
    deals.map do |deal|
      if deal.operation == "Sale"
        sum_amount -= deal.sum
      else
        sum_amount += deal.sum
      end
    end
    sum_amount
  end

  def number_amount
    number_amount = 0
    deals.map do |deal|
      if deal.operation == "Sale"
        number_amount -= deal.number
      else
        number_amount += deal.number
      end
    end
    number_amount
  end
end