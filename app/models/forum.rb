class Forum < ApplicationRecord
    has_many :comments, as: :commentable
end
