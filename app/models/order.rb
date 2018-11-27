class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items

	def total_price
		order_items.sum { |item| item.price }
  end

	def change_status state
		update(status: state)
  end

end
