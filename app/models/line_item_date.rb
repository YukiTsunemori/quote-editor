class LineItemDate < ApplicationRecord
  # このLineItemDateがどの見積もりに属するかを定義
  belongs_to :quote

  # 日付が必須であることと、見積もり内で日付が重複しないことを設定する
  validates :date, presence: true, uniqueness: { scope: :quote_id }
  # このscopeはquote_idが同じ日付を複数持つことを許さないと言う意味である。

  scope :ordered, -> { order(date: :asc) }
end
