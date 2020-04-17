class StripeRequestService
  def call(event)
    @request = Request.find_by(checkout_session_id: event.data.object.id)
    @request.update(state: 'paid')
  end
end


# class BillingEventLogger
#   def initialize(logger)
#     @logger = logger
#   end

#   def call(event)
#     @logger.info "BILLING:#{event.type}:#{event.id}"
#   end
# end


 # def initializer(logger)
 #    @logger = logger
 #  end

 #  def call(event)
 #    @logger.info "BILLING:#{event.type}:#{event.id}"
 #    @request = Request.find_by(checkout_session_id: event.data.object.id)
 #    @request.update(state: 'paid')
 #  end
