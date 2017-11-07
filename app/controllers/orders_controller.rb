class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_customer!, only: [:new]
  before_action :require_login

  # GET /orders
  # GET /orders.json
Stripe.api_key = "sk_test_XraleY3YiXwA1SaECNkivejC"

  def index
    @orders = Order.where(customer: current_customer)
  end


  # GET /orders/1
  # GET /orders/1.json
  def show

  end

  # GET /orders/new
  def new
    @order = Order.new
    @total = get_cart_total
    @customer = current_customer
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    token = params[:stripeToken]
    total = (get_cart_total*100).round
    charge = Stripe::Charge.create(
      :amount => total,
      :currency => "usd",
      :description => "Example charge",
      :source => token,
    )
    logger.warn(charge.outcome.network_status.include? "approved")
    logger.warn("stripe token::::: " + token)
    logger.warn(charge.id)
    if charge.outcome.network_status.include? "approved"
      @cart_items = get_cart_items
      @customer = current_customer
      @order = Order.create(customer: @customer, total: get_cart_total, stripe_key: charge.id, zip: params[:order][:zip], state_id: params[:order][:state_id], address: params[:order][:address], city: params[:order][:city], notes: params[:order][:notes])
      @cart_items.each do |cart_item|
      @order_contents = OrderContent.create(order_id: @order.id, item_id: cart_item[:item].id, qty: cart_item[:qty])
    end


  end

respond_to do |format|
    if @order.save && @order_contents.save
      puts "Success"
      del_cookies
      format.html { redirect_to @order, notice: 'Order was succesfully created.' }
      # format.json { render :show, status: :ok, location: @order}
    end
  end
  end



  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
          @customer = current_customer
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:total, :notes, :state_id, :address,:city, :zip)
    end

    def item
      logger.warn("Item ID: ")
      logger.warn (params[:item])
      params.permit(:item)
    end

    def require_login
      unless current_customer
        redirect_to new_customer_session_path
      end
    end
end
