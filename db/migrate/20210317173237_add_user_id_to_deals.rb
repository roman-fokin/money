class AddUserIdToDeals < ActiveRecord::Migration[6.1]
  def change
    add_column :deals, :user_id, :integer, null: false
  end
end
