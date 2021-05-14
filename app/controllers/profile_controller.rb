class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    get_tours
  end

  private
  def get_tours
    @confirmed_orders =  Tour.joins(:oders).where(oders: { status: true, user_id: @user.id }).to_a
    @unconfirmed_orders = Tour.joins(:oders).where(oders: { status: false, user_id: @user.id }).to_a
  end
end
