require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }

  context 'All methods testing for User implementation' do
    it 'Add user should return true' do
      expect(subject).to be_valid
    end

    it 'Method should return false' do
      expect(subject.recent_posts.length).to be 0
    end

    it 'Post counter should be an integer' do
      expect(subject.posts_counter).to be_a_kind_of(Numeric)
    end
  end
end
