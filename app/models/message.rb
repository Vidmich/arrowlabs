class Message < ActiveRecord::Base
  attr_accessible :body, :from

  validates :from, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 100000 }
end
