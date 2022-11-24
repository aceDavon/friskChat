class Post < ApplicationRecord
  after_save :update_posts_counter

  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  validates :title,
            length: { minimum: 5, maximum: 250, message: 'fields can not be less than 5 letters and more than 250 letters' }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_five
    comments.includes([:author]).last(5)
  end

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
