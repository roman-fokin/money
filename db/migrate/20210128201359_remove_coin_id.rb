class RemoveCoinId < ActiveRecord::Migration[6.1]
  def change
    remove_column :deals, :coin_id
  end
end
