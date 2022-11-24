require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
  end

  before(:example) do
    @new_post = Post.create(author_id: subject, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
  end

  context 'All test implementation for Post Model' do
    it 'Check for length of post title' do
      expect(@new_post.title).to(satisfy { |x| x.length <= 250 })
    end

    it 'Method should return false' do
      expect(@new_post.last_five.length).to be 0
    end

    it 'likes counter validations should return true' do
      expect(@new_post.likes_counter).to(satisfy { |n| n >= 0 })
    end
  end
end
