class DeleteUderIdFromOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :uder_id, :integer
  end
end
