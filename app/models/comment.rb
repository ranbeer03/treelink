class Comment < ApplicationRecord
  belongs_to :tree
  belongs_to :user
end
