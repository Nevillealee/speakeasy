class EnrollmentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        current_user.enrollments.create(course: current_course)
        redirect_to course_path(current_course)
        
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
        
    end
    
    private
    
    def current_course
        @current_course ||= Course.find(params[:course_id])
    end
end
