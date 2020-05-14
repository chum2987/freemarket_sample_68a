class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :purchase]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @item = Item.all
  end


  # @item.item_images.newという記述により、
  # newアクションで定義されたitemクラスのインスタンスに関連づけられた
  # item_imagesクラスのインスタンスが作成されます。
  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def purchase
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item)
      .permit(:name, :price, :description, :category_id, :size, :brand, :condition, :shipping_fee, :shipping_method, :shipping_date, :buyer_id, :seller_id, item_images_attributes: [:image_url]).merge(seller_id: current_user.id)
  end

end
