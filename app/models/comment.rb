class Comment < ApplicationRecord
  after_save :update_comments_counter

  belongs_to :post, class_name: 'Post'
  belongs_to :author, class_name: 'User'

  validates :text,
            length: { minimum: 5, maximum: 150, message: 'fields can not be less than 5 letters and more than 250 letters' }

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
