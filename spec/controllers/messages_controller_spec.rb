require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { build(:message, user_id: user.id, group_id: group.id) }

    #メッセージ一覧をindexアクション
    describe 'GET #index' do
      context "ログインしているユーザー" do
        #ログイン状態
        before do
          login_user user
        end
        #共通のメソッド
        before :each do
          get :index, params: { group_id: group.id }
        end

        it "アクション内で定義済みの@messageがある？" do
          message = Message.new
          expect(assigns(:message)).to be_a_new Message
        end

        it "アクション内で定義済み@groupがある？" do
          expect(assigns(:group)).to eq group
        end

        it "アクション内で定義済みの@messagesがある" do
          messages = group.messages
          expect(assigns(:messages)).to eq messages
        end

        it "アクション内で定義済み@groupsがある？" do
          groups = user.groups
          expect(assigns(:groups)).to eq groups
        end

        it "アクション内で定義済みの@usersがある？" do
          users = group.users
          expect(assigns(:users)).to eq users
        end

        it "インデックス画面に遷移するか？" do
          expect(response).to render_template :index
        end
      end

      context 'ログインしてない場合' do
        it 'ログイン画面にリダイレクトできているか？' do
          get :index, params: { group_id: group.id }
          expect(response).to redirect_to new_user_session_path
        end
      end
    end

    #メッセージ作成のアクション(POST #CREATE)
    describe 'POST #create' do
      before :each do
        login_user user
      end

      context 'ログインしていて、保存できた場合' do
        it "メッセージの保存はできたのか？" do
          expect {
            post :create, params: { message: attributes_for(:message, {body: message.body }),group_id: group.id, user_id: user.id }}.to change(Message, :count).by(1)
        end

        it "投稿成功時にフラッシュメッセージの表示はあるか？" do
          post :create, params: { group_id: group.id, user_id: user.id, message: attributes_for(:message, { body: 'testtest' })}
          expect(flash[:notice]).to include("送信されました")
        end

        it "チャット画面に遷移しているか？" do
          post :create, params: { message: attributes_for(:message, { body: message.body }), group_id: group.id, user_id: user.id }
          expect(response).to redirect_to group_messages_path(group.id)
        end
      end

      context 'ログインはしているが、保存できなかった場合' do
        it 'メッセージの保存は行われなかったか？' do
          expect {
            post :create, params: {
               message: attributes_for(:message, { body: nil, image: nil }), group_id: group.id, user_id: user.id } }
               .not_to change(Message, :count)
        end

        it '投稿失敗時にフラッシュメッセージの表示はあるか？' do
          post :create, params: { group_id: group.id, user_id: user.id, message: attributes_for(:message, { body: nil, image: nil}) }
          expect(flash[:alert]).to include("メッセージかイメージを入力して下さい")
        end

        it '意図したビューへ遷移するか？' do
          post :create, params: { message: attributes_for(:message, { body: nil, image: nil }), group_id: group.id, user_id: user.id }
          expect(response).to render_template :index
        end
      end
    end
    context 'ログインしていない場合' do
      it "意図した画面にリダイレクトできているか？" do
        post :create, params: { group_id: group.id, user_id: user.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
end
