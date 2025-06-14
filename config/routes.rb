Rails.application.routes.draw do
  devise_for :users
  # devise_forはauthenticate_user!やdevise_controller?ヘルパーメソッドを生成する
  # Railsアプリケーション全体で、devise認証機能が利用可能になるための1行。
  resources :quotes
  root to: "pages#home"
end
