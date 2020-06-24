class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :purchase, :pay]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.limit(3).order('id DESC')
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
      @item.item_images.new
      render :new
    end
  end

  def show
    @parents = Category.where(ancestry: nil)
  end

  def edit
  end

  def update
    #カテゴリーを孫まで選択していない場合、category_idが"---"と送られてくる。それは通したくないので条件分岐。
    if item_params[:category_id] == "---"
      render :edit
    elsif @item.update(item_params)
      redirect_to item_path
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

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: current_user.credit_card.customer_id,
      currency: 'jpy'
    )
    if @item.update(buyer_id: current_user.id)
      redirect_to root_path
    else
      redirect_to pay_item_path
    end
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
    params.require(:item).permit(:name, :price, :description, :category_id, :size, :brand, :condition, :shipping_fee, :shipping_method, :shipping_date, :seller_id, item_images_attributes: [:image_url, :_destroy, :id]).merge(seller_id: current_user.id)
  end

end
