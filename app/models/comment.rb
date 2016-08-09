class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  belongs_to :topics

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
