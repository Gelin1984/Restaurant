class RemovePriceFromOrderItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_items, :price, :decimal
  end
end
