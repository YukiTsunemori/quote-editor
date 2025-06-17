class ApplicationController < ActionController::Base
  # before_action -> { sleep 0.5 }
  # turbo driveを使用すると、プログレスバーがオフになるため手動で設定する必要がある。
  # sleep 0.5秒でプログレスバーを表示させる。

  include Devise::Controllers::Helpers

  before_action :authenticate_user!, unless: :devise_controller?
  # authenticate_user!メソッドは、ユーザーがログインしているかどうかを確認し、ログインしていない場合はログインページにリダイレクトします。
  # unless: :devise_controller?は、未認証のユーザーがログインフォームにアクセスできるようにする。

  private
  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end
  helper_method :current_company
  # ここでヘルパーメソッドとして公開
  # このコントローラー内でしか、基本的にはこのメソッドは呼び出せない。
  # ビューファイルから呼び出すためには、明示的にhelper_methodとして公開する必要がある。
end
