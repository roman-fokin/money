class User < ApplicationRecord
  has_many :deals
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
  end
end
