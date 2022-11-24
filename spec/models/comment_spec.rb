require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    User.create(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  before(:example) do
    @new_post = Post.create(id: 1, author_id: subject, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)

    @new_comment = Comment.create(author_id: 1, post_id: 1, text: 'Hello, this is my first comment')
  end

  context 'Validations should be working' do
    it 'validations should return true' do
      expect(@new_comment.text).to satisfy { |x| x.length <= 150 }
    end
  end
end