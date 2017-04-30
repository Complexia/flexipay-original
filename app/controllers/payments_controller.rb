class PaymentsController < ApplicationController

  before_action :logged_in_user

  def new

  end

  def create

    @amount = 500

    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount,
                                      description: 'Rails Stripe customer')

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to deposit_path

 end




  def confirmation

  end


  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
