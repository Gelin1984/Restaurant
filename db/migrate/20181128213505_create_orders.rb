class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :uder_id
      t.float :total
      t.string :status

      t.timestamps
    end
  end
end
