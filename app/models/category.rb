class Category < ApplicationRecord
  has_many :products, dependent: :delete_all

  def featured_product
    products.featured.first
  end
end
