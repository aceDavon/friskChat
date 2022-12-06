require 'rails_helper'

RSpec.describe 'users/[show,.html.erb', type: :view do
  describe 'test' do
    before(:each) do
      @user = User.create(name: 'Tolo Tolo',
                          photo: 'https://picsum.photos/200',
                          bio: 'Nigerian Business Lady',
                          posts_counter: 0)
      Post.create(author_id: @user.id, title: 'Hello 1', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
      Post.create(author_id: @user.id, title: 'Hello 2', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
      Post.create(author_id: @user.id, title: 'Hello 3', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
      @last_post = Post.create(author_id: @user.id, title: 'Hello 4', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)
      @id = @user.id
      visit user_path(@id)
    end

    it 'shows user name' do
      expect(page).to have_content(@user.name)
    end

    it 'shows user biography' do
      expect(page).to have_content(@user.bio)
    end

    it 'shows only the users last 3 posts' do
      expect(page).to have_content('Hello 2')
      expect(page).to have_content('Hello 3')
      expect(page).to have_content('Hello 4')
      expect(page).not_to have_content('Hello 1')
    end

    it 'shows the user photo' do
      expect(page.body).to include('https://picsum.photos/200')
    end

    it 'shows number of posts user has written' do
      expect(page.body).to include('Posts Count: 4')
    end

    it 'shows the See all posts button' do
      expect(page).to have_content('See all posts')
    end

    it 'Redirect to post show page when a post is clicked' do
      click_link(@last_post.title)
      expect(current_path).to eq(user_post_path(@user, @last_post))
    end

    it 'Tests for redirect to show all user posts when the "See all button" is clicked' do
      click_link('See all posts')
      expect(current_path).to eq(user_posts_path(@user))
      expect(current_path).to eq "/users/#{@user.id}/posts"
    end
  end
end
