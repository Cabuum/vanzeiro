class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable

  validates_presence_of :email

  has_many :authorizations, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_one :configuration, foreign_key: 'user_id', class_name: 'MyConfiguration', dependent: :destroy

  mount_uploader :image, ImageUploader

  def name_to_billet
    social_reason.blank? ? name : social_reason
  end

  def has_authorizations?
    true if authorizations.count.to_i > 0
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid.to_s, token: auth.credentials.token,
                                        secret: auth.credentials.secret).first_or_initialize
    if authorization.user.blank?

      user = current_user.nil? ? User.where('email = ?', auth.info.email).first : current_user
      if user.blank?
        user = User.new
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.email = auth.info.email
        user.image = URI.parse(auth.info.image) if auth.info.image?
        user.save!
      end

      authorization.username = auth.info.name
      authorization.user_id = user.id
      authorization.save
    end
    authorization.user
  end
end