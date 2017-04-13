class Election < ApplicationRecord
  has_many :election_users
  has_many :election_candidates
end
