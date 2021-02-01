class RemoveCoin < ActiveRecord::Migration[6.1]
  def change
    remove_column :deals, :coin
  end
end
