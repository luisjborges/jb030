class StripeRequestService
  def call(event)
    request = Request.find_by(checkout_session_id: event.data.object.id)
    request.update(state: 'paid')
  end
end
