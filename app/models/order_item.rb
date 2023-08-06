class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :set_total, :set_unit_price

  def unit_price
    # If there is a record
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total
    unit_price * quantity
  end

  private

  def set_unit_price
    self[:unit_price] = product.price
  end

  def set_total
    self[:total] = total * quantity
  end
end
