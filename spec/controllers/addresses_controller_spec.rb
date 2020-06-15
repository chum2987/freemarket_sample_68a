require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  let(:user) { create(:user) }

  context 'ログイン済ユーザー' do
    before do
      sign_in user
    end

    describe 'GET #new' do
      it "new.html.haml(住所登録ページ)に遷移すること" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      context 'addressの保存に成功した場合' do
        subject do
          address_params = attributes_for(:address, user_id: user.id)
          post :create, params: { address: address_params }
        end

        it 'addressを保存すること' do
          expect do
            subject
            expect{ subject }.to change{ Address.count }.by(1)
          end
        end

        it 'マイページヘリダイレクトすること' do
          subject
          expect(response).to redirect_to(user_path(user.id))
        end
      end

      context '保存に失敗した場合' do
        subject do
          address_params = attributes_for(:address, postal_code: nil)
          post :create, params: { address: address_params }
        end

        it 'addressを保存しないこと' do
          expect do
            subject
            expect{ subject }.to change{ Address.count }.by(0)
          end
        end

        it 'new.html.haml(住所登録ページ)に遷移すること' do
          subject
          expect(response).to render_template :new
        end
      end
    end
  end

  context 'ログインしていない場合' do
    let(:user) { create(:user) }

    it 'topページにリダイレクトすること' do
      post :create
      expect(response).to redirect_to :root
    end
  end
end
