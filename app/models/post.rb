class Post < ApplicationRecord
  has_rich_text :body
  after_create do
    broadcast_prepend_to "home", partial: "pages/last_post", locals: {post: self}
    broadcast_prepend_to "posts", partial: "pages/post", locals: {post: self}
  end
  after_update do
    broadcast_update_to "home", partial: "pages/last_post", locals: {post: self}
    broadcast_update_to "posts", partial: "pages/post", locals: {post: self}
  end
  after_destroy_commit do
    broadcast_remove_to "home"
    broadcast_remove_to "posts"
  end
end
