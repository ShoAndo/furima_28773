class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
         
  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
    validates :kana_first_name, :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' }
    validates :birth_date
  end
end
