class Deal < ApplicationRecord
  belongs_to :coin
  belongs_to :user
  validates :number, presence: true
  validates :sum, presence: true
end
