module DeliveryHelper
  def find_delivery(user_email, key)
    delivery = Delivery.where(email: user_email)
    if delivery[0][key] != nil
      delivery[0][key]
    else
      "n/a"
    end
  end
end
