class Comment < ApplicationRecord
  after_save :update_comments_counter

  belongs_to :post

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
