class TransfersController < ApplicationController
  def new

  end

  def transfer
    @@email = params[:e]
    @@transfer_amount = Integer(params[:t])
    @user = User.find_by_email(@@email)
    @user.update_attribute(:balance, @user.balance + @@transfer_amount)
    current_user.update_attribute(:balance, current_user.balance - @@transfer_amount)
    redirect_to wallet_path
  end
end
