class Company < ApplicationRecord
  validates :name, presence: true
  has_many :users, dependent: :destroy
  # has_many :usersは、Companyモデルが複数のUserモデルに関連付けられていることを示す。
  # dependent: :destroyは、Companyが削除されると、そのCompanyに関連付けられたUserも削除されることを示す。
  has_many :quotes, dependent: :destroy
  # has_many :quotesは、Companyモデルが複数のQuoteモデルに関連付けられていることを示す。
  # dependent: :destroyは、Companyが削除されると、そのCompanyに関連付けられたQuoteも削除されることを示す。
end
