class GroupRelationship < ApplicationRecord
  belings_to :group
  belongs_to :user
end
