class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birth_day, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
  validates :first_name
  validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン一]+\z/, message: '全角(カタカナ)を使用してください' } do
  validates :last_name_kana
  validates :first_name_kana
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, { with: PASSWORD_REGEX, message: 'Passwordには英字と数字の両方を含めて設定してください' } 


end

