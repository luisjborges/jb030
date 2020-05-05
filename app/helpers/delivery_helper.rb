module DeliveryHelper
  def find_delivery(user_id, key)
    delivery = Delivery.where(user_id: user_id).where.not(street: nil)
    if delivery.empty?
      ""
    else
      delivery[0][key]
    end
  end
end
