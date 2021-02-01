class Deal < ApplicationRecord
  validates :number, presence: true
  validates :sum, presence: true
end
