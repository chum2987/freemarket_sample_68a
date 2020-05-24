class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :purchase]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.all
    @item_images = ItemImage.all
  end
  # @item.item_images.newという記述により、
  # newアクションで定義されたitemクラスのインスタンスに関連づけられた
  # item_imagesクラスのインスタンスが作成されます。
  def new
    @parents = Category.order("id ASC").limit(13)
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @parents = Category.where(ancestry: nil)
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

  def category_children
    @category_children = Category.find(params[:productcategory]).children
    # Ajax通信で送られてきたデータをparamsで受け取りchildrenで子を取得
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
    # Ajax通信で送られてきたデータをparamsで受け取り、childrenで孫を取得(実際には子カテゴリーの子となる。childrenは子を取得するメソッド) 
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item)
      .permit(:name, :price, :description, :category_id, :size, :brand, :condition, :shipping_fee, :shipping_method, :shipping_date, :seller_id, item_images_attributes: [:image_url]).merge(seller_id: current_user.id)
  end

end
