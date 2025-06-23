Rails.application.routes.draw do
  devise_for :users
  # devise_forはauthenticate_user!やdevise_controller?ヘルパーメソッドを生成する
  # Railsアプリケーション全体で、devise認証機能が利用可能になるための1行。
  resources :quotes do
    resources :line_item_dates, except: [ :index, :show ]
    # indexアクションは全ての日付がすでにshowページに表示されるため、必要ない。
    # showアクションはここの日付明細だけを見ることに意味がないため必要ない。
  end
  root to: "pages#home"
end
