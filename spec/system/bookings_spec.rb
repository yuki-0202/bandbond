require 'rails_helper'

RSpec.describe 'ブッキング管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ブッキング投稿テスト' do
    it 'ブッキング投稿に成功し、トップページへ遷移する' do

    end
    it 'ブッキング投稿に失敗し、再びブッキング投稿ページへ戻ってくる' do

    end
  end

  context 'ブッキング編集テスト' do
    it 'ブッキング編集に成功し、ブッキング詳細ページへ遷移する' do

    end
    it 'ブッキング編集に失敗し、再びブッキング編集ページへ戻ってくる'

  end

  context 'ブッキング削除テスト' do
    it 'ブッキングの削除に成功し、トップページへ遷移する' do

    end
  end
end
