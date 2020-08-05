class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  zenkaku = /\A[ぁ-んァ-ン一-龥]/
  kana = /\A[ァ-ヶー－]+\z/
  nick = /\A[a-zぁ-んァ-ン一-龥0-9]{,40}\z/i

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }, format: { with: nick, message: 'は40字以内で入力してください' }
    validates :first_name, :last_name, format: { with: zenkaku, message: 'は全角で入力してください。' }
    validates :kana_first_name, :kana_last_name, format: { with: kana, message: 'は全角カタカナで入力して下さい。' }
    validates :birth_date
  end
end
