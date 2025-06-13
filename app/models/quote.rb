class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  # orderedというクラスメソッド(スコープ)を定義する。
  # このメソッドが呼び出されると、order(id: :desc)というActive Recordクエリが実行され、
  # DBから取得されるレコードがIDの降順にソートされる！
end
