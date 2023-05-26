class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_no, :name, :description, :price, :quantity, :user_id, :discount
  has_many :order_items
  def discount
    if object.price.to_i > 1000
      discount = 50
    else
      discount = 0
    end
  end
end
