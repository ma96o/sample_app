ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# 単体テスト用のメソッドを定義
class ActiveSupport::TestCase
  fixtures :all

  # テストユーザーがログイン中の場合にtureを返す
  def is_logged_in?
    !session[:user_id].nil?
  end

  # テストユーザーとしてログインする
  def log_in_as(user)
    sesssion[:user_id] = user.id
  end
end

# 統合テスト用のメソッドを定義
class ActionDispatch::IntegrationTest

  # テストユーザーとしてログインする。passwordとremember_meには初期値を与える
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                  password: password,
                                  remember_me: remember_me } }
  end
end
