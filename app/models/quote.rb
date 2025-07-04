class Quote < ApplicationRecord
  has_many :line_item_dates, dependent: :destroy
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  # orderedというクラスメソッド(スコープ)を定義する。
  # このメソッドが呼び出されると、order(id: :desc)というActive Recordクエリが実行され、
  # DBから取得されるレコードがIDの降順にソートされる！

  # after_create_commit -> { broadcast_prepend_later_to "quotes" } # 以下の構文と等価。
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  # broadcast_prepend_toメソッドの役割.
  # HTMLの生成 -> 指定されたパーシャル_quote.html.erbを使ってHTMLを生成する。
  # target -> "quotes"というIDを持つ要素に対して、生成されたHTMLを追加する。
  # quots :self -> 現在のQuoteオブジェクトを渡す。
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  broadcasts_to ->(quote) { [ quote.company, "quotes" ] }, inserts_by: :prepend
  # railsはこのメソッド1行で、上に書いた3行のコードを実行する。
  # broadcasts_toメソッドは、RailsのAction Cableを使用して、リアルタイムでの更新を可能にする。
  # 6章にて、
  # この1行は「このモデルのデータが変更されたとき、どこにその変更情報をリアルタイムで通知するか」
  # を指定するもの。


  belongs_to :company
end
