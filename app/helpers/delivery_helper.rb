module DeliveryHelper
  def find_delivery(user_email, key)
    delivery = Delivery.where(email: user_email)
    deli = delivery[0][key]
  end
end
