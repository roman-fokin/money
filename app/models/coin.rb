class Coin < ApplicationRecord
  has_many :deals
  validates :title, presence: true, length: { minimum: 3 }
  validates :ticker, presence: true
end
