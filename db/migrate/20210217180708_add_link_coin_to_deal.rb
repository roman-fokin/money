class AddLinkCoinToDeal < ActiveRecord::Migration[6.1]
  def change
    add_reference(:deals, :coin)
  end
end
