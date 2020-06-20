require 'rails_helper'

describe ItemsController do
  # このテストで使うitemに紐づくユーザーとカテゴリーの情報を作成
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  # HTTPメソッドとアクションを指定する。
  describe 'GET #new' do

    # newアクションはログインしている時としていない時で遷移が違うので、contextで場合分け。
    context 'ログインしている場合' do

      # 各テストが実行される直前に毎回実行される処理をbefore内に記述。
      before do
        # 別ファイルで指定したインスタンス変数のloginと上記で指定したuserを使用してログイン状態を指定
        login user
        get :new
      end

      # アクションが呼ばれたあと期待したビューが表示されるか
      it "new.html.hamlに遷移すること" do
        expect(response).to render_template :new
      end

      # アクション内で定義するインスタンス変数の値が期待したものになるか
      it "@parentsに正しい値が入っていること" do
        categories = create_list(:category, 13)
        expect(assigns(:parents)).to eq categories
      end

      it "@itemに正しい値が入っていること" do
        item = build(:item, seller_id: user[:id], category_id: category[:id])
        expect(assigns(:item)).to be_a_new(Item)
      end

    end

    context 'ログインしていない場合' do

      it "ログインページに遷移する" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end

    end

  end

  # HTTPメソッドとアクションを指定する。
  describe "GET #show" do
    before do
      login user
      get :new
      @item = Item.new(
        id: "1",
        name: "saba",
        price: "500"
      )
    end
    # アクション内で定義するインスタンス変数の値が期待したものになるか
    it "リクエストが成功すること" do
      get :show, params: { id: @item.id }
      expect(response.status).to eq(200)
    end
    # アクションが呼ばれたあと期待したビューが表示されるか
    it "show.html.hamlに遷移すること" do
      get :show, params: { id: @item.id }
      expect(response).to render_template :show
    end
    # アクション内で定義するインスタンス変数の値が期待したものになるか
    it "@parentsに正しい値が入っていること" do
      categories = create_list(:category, 13)
      expect(assigns(:parents)).to eq categories
    end
  end

  describe "GET #edit" do
    before do
      @item = Item.new(
        id: "1",
        name: "saba",
        price: "500"
      )
    end
    # アクション内で定義するインスタンス変数の値が期待したものになるか
    it "リクエストが成功すること" do
      get :edit, params: { id: @item.id }
      expect(response.status).to eq(200)
    end
    # アクションが呼ばれたあと期待したビューが表示されるか
    it "edit.html.hamlに遷移すること" do
      get :edit, params: { id: @item.id }
      expect(response).to render_template :edit
    end
  end
<<<<<<< HEAD
=======

>>>>>>> 083c39cd2b271520ba24cad4aef621e7e48ece8e
end