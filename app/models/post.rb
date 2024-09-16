class Post < ApplicationRecord
    # app/models/post.rb

validates :title, presence: true
validates :body, presence: true

end
