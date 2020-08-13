class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :items
  has_many :purchases
  has_one :card, dependent: :destroy
  has_many :sns_credentials

  zenkaku = /\A[ぁ-んァ-ン一-龥]/
  kana = /\A[ァ-ヶー－]+\z/
  nick = /\A[a-zぁ-んァ-ン一-龥0-9]{,40}\z/i

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }, format: { with: nick, message: 'は40字以内で入力してください' }
    validates :first_name, :last_name, format: { with: zenkaku, message: 'は全角で入力してください。' }
    validates :kana_first_name, :kana_last_name, format: { with: kana, message: 'は全角カタカナで入力して下さい。' }
    validates :birth_date
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
