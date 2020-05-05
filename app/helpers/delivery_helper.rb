module DeliveryHelper
  def find_delivery(user_email, key)
    delivery = Delivery.where(email: user_email)
    if delivery.nil?
      "n/a"
    else
      delivery[0][key]
    end
  end
end
