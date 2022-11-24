class Post < ApplicationRecord
  after_save :update_posts_counter

  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  def last_five
    comments.includes([:author]).last(5)
  end

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
