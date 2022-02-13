require 'rails_helper'

describe 'Blog operations' do
  before do
    @post = create(:post)
    visit root_path
  end

  describe 'listing' do
    it "should have element listing" do
      click_link 'Home'
      expect(page).to have_content("First post")
    end
  end

  describe 'total values' do
    it "should have total and views in the header" do
      expect(page).to have_content("Total of posts: 1 - Total of views: 0")
      post = create(:post, title: Faker::Movie.title)
      visit post_path(post)
      expect(page).to have_content("Total of posts: 2 - Total of views: 1")
    end
  end

  describe 'create and update' do
    before do
      click_link 'Posts'
    end

    it 'should create a Post' do
      click_link 'New post'
      fill_in 'Title', with: 'New post title'
      click_on 'Create Post'
      expect(page).to have_content("New post title")
    end

    it 'should edit a Post' do
      find("a[href='#{post_path(@post.id)}']").click
      click_link 'Edit this post'
      fill_in 'Title', with: 'Post updated'
      click_on 'Update Post'
      expect(page).to have_content("Post updated")
    end

    it 'should destroy company' do
      post = create(:post, title: Faker::Movie.title)
      visit posts_path
      expect(page).to have_content(post.title)
      find("a[href='#{post_path(post.id)}']").click
      click_on "Destroy this post"
      expect(page).to have_no_content(post.title)
    end
  end
end