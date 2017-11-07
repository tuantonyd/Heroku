class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_customer!, only: [:new]

  # GET /items
  # GET /items.json
  def index
    @items = Item.where(available: :true)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new

  end

  # GET /items/1/edit
  def edit
  end


  def remove_cookie
    logger.warn "DELETING COOKIE"
    cookie_id = "item_" + params[:cookieIndex]
    logger.warn(cookie_id)
    logger.warn(cookies[cookie_id])
    cookies.delete cookie_id
    redirect_to :cart
  end

  def cart
    @items = Array.new
    @items = get_cart_items
    puts "Items in array: "
    puts @items
    puts "Cart total: "
    puts get_cart_total
    @total = get_cart_total
  end




  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item = Item.new

    respond_to do |format|
      if @item.save
        if params[:images]
          params[:images].each { |image|
              @item.images.create(file: image)
            }
          end
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:name, :description, :price, :picture, :total, :notes, :customer, :item_status_id, :available)
    params.permit(:images)
  end
end
