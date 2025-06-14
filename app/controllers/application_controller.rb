class ApplicationController < ActionController::Base
  # before_action -> { sleep 0.5 }
  # turbo driveを使用すると、プログレスバーがオフになるため手動で設定する必要がある。
  # sleep 0.5秒でプログレスバーを表示させる。

  include Devise::Controllers::Helpers

  before_action :authenticate_user!, unless: :devise_controller?
  # authenticate_user!メソッドは、ユーザーがログインしているかどうかを確認し、ログインしていない場合はログインページにリダイレクトします。
  # unless: :devise_controller?は、未認証のユーザーがログインフォームにアクセスできるようにする。
end
