class PagesController < ApplicationController
  def home
    @posts = Post.all
  end

  def posts
    @posts = Post.all
  end
end
