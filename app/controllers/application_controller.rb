class ApplicationController < ActionController::Base
  before_action -> { sleep 0.5 }
  # turbo driveを使用すると、プログレスバーがオフになるため手動で設定する必要がある。
  # sleep 0.5秒でプログレスバーを表示させる。
end
