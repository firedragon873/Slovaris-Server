class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable,
         :recoverable

  validates :login, presence: true,
                    uniqueness: true,
                    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :email, presence: false,
                    uniqueness: true,
                    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  has_attached_file :avatar, styles: { mini: '100x100>', small: '300x300>', medium: '320x320>', large: '640x640>' },
                           url: '/system/images/:id/:style/:basename.:extension',
                           path: ':rails_root/public/system/images/:id/:style/:basename.:extension'
  validates_attachment :avatar, content_type: { content_type: %w(image/jpeg image/jpg image/png) }

  before_save :ensure_authentication_token

  has_one :user_group

  enum gender: [:male, :female]


  def change_password(password, password_confirmation)
    new_token = generate_authentication_token
    self.authentication_token = new_token
    self.password = password
    self.password_confirmation = password_confirmation
    self.save
  end

  private

    def ensure_authentication_token
      if self.authentication_token.blank?
        self.authentication_token = generate_authentication_token
      end
    end

    def generate_authentication_token
      loop do
        token = Devise.friendly_token(30)
        break token unless User.where(authentication_token: token).first
      end
    end

end
