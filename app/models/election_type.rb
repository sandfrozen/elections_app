class ElectionType < ApplicationRecord
  has_many :elections, :dependent => :restrict_with_error
end
