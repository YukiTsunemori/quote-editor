class Quote < ApplicationRecord
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

  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
  # railsはこのメソッド1行で、上に書いた3行のコードを実行する。
  # broadcasts_toメソッドは、RailsのAction Cableを使用して、リアルタイムでの更新を可能にする。
  belongs_to :company
end
