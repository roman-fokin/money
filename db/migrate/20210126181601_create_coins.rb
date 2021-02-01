class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.string :title
      t.string :ticker

      t.timestamps
    end
  end
end
