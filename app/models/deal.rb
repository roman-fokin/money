class Deal < ApplicationRecord
  belongs_to :coin
  validates :number, presence: true
  validates :sum, presence: true
end
