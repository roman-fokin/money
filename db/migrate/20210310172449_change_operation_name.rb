class ChangeOperationName < ActiveRecord::Migration[6.1]
  def change
    Deal.where(operation: "Продажа").update_all(operation: "Sale")
    Deal.where(operation: "Покупка").update_all(operation: "Buy")
  end
end
