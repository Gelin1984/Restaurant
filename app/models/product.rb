class Product < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_many :comments
  belongs_to :order_item

  def self.search(search_term)
    if Rails.env.production?
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end

  def average_rating
    comments.average(:rating).to_f.round(2)
  end

  def highest_rating
    comments.maximum(:rating)
  end

  def lowest_rating
    comments.minimum(:rating)
  end

end
