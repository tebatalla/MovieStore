# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  nickname        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :nickname, :email, :password_digest, :session_token, presence: true
  validates :nickname, :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }, confirmation: true
  validates_presence_of :password_confirmation, on: :create
  before_validation :ensure_session_token

  has_many :orders, class_name: 'Library', foreign_key: 'user_id'
  has_many :movies, through: :orders, source: :movie

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    save
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    save
  end

  def password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.password?(password) ? user : nil
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
