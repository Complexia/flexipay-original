require 'stripe'
class PaymentsController < ApplicationController

  before_action :logged_in_user


  def new


  end
=begin
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
=end

def create


  # Amount in cents
=begin
@amount = 200

# Set your secret key: remember to change this to your live secret key in production
# See your keys here https://dashboard.stripe.com/account/apikeys


# Get the credit card details submitted by the form
token = params[:stripeToken]



# Create the charge on Stripe's servers - this will charge the user's card
begin
    charge = Stripe::Charge.create(
    :amount => @amount, # amount in cents, again
    :currency => "usd",
    :source => token,
    :source => customer,
    :description => "Example charge"
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  #redirect_to new_charge_path
end
=end

end



  def confirmation

    @amount = 5

    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])


    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount * 100,
                                      description: 'Rails Stripe customer')

    if current_user.balance.nil?
      current_user.update_attribute(:balance, @amount)
    else
      current_user.update_attribute(:balance, current_user.balance + @amount)
    end




    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to deposit_path

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
