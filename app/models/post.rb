class Post < ApplicationRecord
    has_many :comments
    has_one_attached :post_image
end
