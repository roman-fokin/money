class Coin < ApplicationRecord
  has_many :deals, dependent: :restrict_with_exception 
  validates :title, presence: true, length: { minimum: 3 }
  validates :ticker, presence: true
 
  #?????
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  #?????
  
  def sum_amount
    sum_amount = 0
    deals.where(user_id: current_user.id).map do |deal|
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
    deals.where(user_id: current_user.id).map do |deal|
      if deal.operation == "Sale"
        number_amount -= deal.number
      else
        number_amount += deal.number
      end
    end
    number_amount
  end
end