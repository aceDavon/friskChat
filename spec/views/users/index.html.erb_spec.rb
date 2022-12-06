require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  describe 'test' do
    before(:each) do
      @user = User.create(name: 'Mary',
                          photo: 'https://picsum.photos/200',
                          bio: 'Nigerian Lady',
                          posts_counter: 0)
      visit users_path
    end

    it 'shows user name' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the user photo' do
      expect(page.body).to include('https://picsum.photos/200')
    end

    it 'shows number of posts user has written' do
      expect(page.body).to include('Posts Count: 0')
    end

    it 'Redirect to post show page when a post is clicked' do
      find_link('Mary').click
      expect(current_path).to eq(user_path(@user.id))
    end
  end
end
