module DeliveryHelper
  def find_delivery(user_id, key)
    delivery = Delivery.where(user_id: user_id)
    if delivery.empty?
      "n/a"
    else
      delivery[0][key]
    end
  end
end
