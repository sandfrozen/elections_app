class ElectionUser < ApplicationRecord
  belongs_to :User
  belongs_to :Election
end
