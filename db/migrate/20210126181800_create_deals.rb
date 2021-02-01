class CreateDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :deals do |t|
      t.references :coin, null: false, foreign_key: true
      t.string :operation
      t.float :number
      t.float :sum

      t.timestamps
    end
  end
end
