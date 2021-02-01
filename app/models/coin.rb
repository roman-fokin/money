class Coin < ApplicationRecord
    validates :title, presence: true, :length => {:minimum  => 3}
    validates :ticker, presence: true
end