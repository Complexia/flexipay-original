class WalletController < ApplicationController

  before_action :logged_in_user

  def balance





  end

  def bitcoin



  end

  def convert



  end

  def confirmation

    @@convert_amount = Integer(params[:w])
    if @@convert_amount <= current_user.balance
      if current_user.bitcoin.nil?
        current_user.update_attribute(:bitcoin, @@convert_amount)

      else

        current_user.update_attribute(:bitcoin, current_user.bitcoin.to_i + @@convert_amount)
      end

      current_user.update_attribute(:balance, (current_user.balance - @@convert_amount))

    end

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
