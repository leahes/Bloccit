class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  belongs_to :topics
  belongs_to :post

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

  default_scope { order('updated_at ASC') }

  after_create :send_favourite_emails

  private

  def send_favourite_emails
     post.favourites.each do |favourite|
       FavouriteMailer.new_comment(favourite.user, post, self).deliver_now
    end
  end
end
