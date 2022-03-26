require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do

  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインテスト' do
    it 'ログインに成功し、トップページに遷移する' do
      basic_pass new_user_session_path
      expect(current_path).to eq(new_user_session_path)
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_on('Log in')
      expect(current_path).to eq(root_path)
    end

    it 'ログインに失敗し、再びサインインページに戻ってくる' do
      basic_pass new_user_session_path
      fill_in 'user[email]', with: 'test'
      fill_in 'user[password]', with: 'test'
      click_on('Log in')
      expect(current_path).to eq(new_user_session_path)
    end

    it 'ログイン状態でサインインページへ遷移しようとすると、トップページへ戻される' do
      basic_pass new_user_session_path
      expect(current_path).to eq(new_user_session_path)
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_on('Log in')
      expect(current_path).to eq(root_path)
      visit new_user_session_path
      expect(current_path).to eq(root_path)
    end
  end

  private

  def basic_pass(path)
    username = 'admin'
    password = '7777'
    visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
  end
end
