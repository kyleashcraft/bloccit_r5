class User < ApplicationRecord
  before_save { self.email = email.downcase if email.present?
                self.name = self.name.split.each{|n| n.capitalize!}.join(" ") if name.present?
                self.role ||= :member }
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { password_digest.nil? }
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 254 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum role: [:member, :admin]

  has_secure_password
end
