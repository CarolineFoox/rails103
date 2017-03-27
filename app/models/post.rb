class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :title, persence:true
end
