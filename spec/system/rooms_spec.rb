require 'rails_helper'

RSpec.describe 'ルーム管理機能', type: :system do
  context 'ルーム自動作成テスト' do
    it 'ルーム自動作成に成功し、ルーム詳細ページへ遷移する' do
    end
    it 'すでにルームが存在する場合、ルーム自動作成は実行されず、該当のルーム詳細ページへ遷移する' do
    end
  end

  context 'ルーム自動削除テスト' do
    it 'ルーム自動削除に成功し、ブッキング詳細ページへ遷移する' do
    end
    it 'ルーム内にチャットが存在する場合、ルーム自動削除は実行されず、ブッキング詳細ページへ遷移する' do
    end
  end
end
