class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :date, length: { minimum: 5}, presence: true
  validates :user, presence: true
end
