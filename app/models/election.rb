class Election < ApplicationRecord
  has_many :election_users
  has_many :election_candidates
  belongs_to :Election_type
end
