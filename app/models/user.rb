class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable
  # この1行は、Deviseの機能を有効にするためのもの。
  # :database_authenticatableは、データベースに保存されたパスワードを使用して認証を行う。
  # :validatableは、パスワードのバリデーションを提供する。
  belongs_to :company
  # belongs_to :companyは、UserモデルがCompanyモデルに属していることを示す。
  # つまり、Userは1つのCompanyに関連付けられている。

  def name
    email.split("@").first.capitalize
  end
end
