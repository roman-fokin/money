class AddColumnToDeals < ActiveRecord::Migration[6.1]
  def change
    add_column :deals, :coin, :string
  end
end
