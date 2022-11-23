class Like < ApplicationRecord
  after_save :update_likes_counter
  belongs_to :post

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
