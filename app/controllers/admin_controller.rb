class AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_customer!
  before_action :verify_admin

  def index
    # Post.paginate(:page => params[:page], :per_page => 30)
    @orders = Order.where(order_status: 1).paginate(:page => params[:page])
     @states_with_orders = Order.joins(:state).pluck(:state_id, :state_name).uniq #Get states that have an order
     @unavailable_inventory = ReportingHelper.unavailable_inventory
  end

  def items
    @items = Item.all
  end





end
