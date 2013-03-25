class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :name

  validates :name, presence: true, length: {maximum: 100}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 100}, format: {with: VALID_EMAIL_REGEX}
  validates :message, presence: true, length: {maximum: 10000}
end
