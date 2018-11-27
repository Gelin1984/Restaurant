class ChangePriceToInt < ActiveRecord::Migration[5.1]
  def change
  	change_column :products, :price, 'integer USING CAST(price AS integer)'
  end
end
