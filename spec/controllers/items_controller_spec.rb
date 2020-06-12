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

    end

    context 'ログインしていない場合' do
    end

  end

  # 以下、その他のアクションのテストコードを生成

end