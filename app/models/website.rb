class Website < ApplicationRecord
  has_many :blog_posts, dependent: :delete_all
end
