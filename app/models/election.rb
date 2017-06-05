class Election < ApplicationRecord
  has_many :Election_users
  has_many :Election_candidates
  belongs_to :Election_type
end
