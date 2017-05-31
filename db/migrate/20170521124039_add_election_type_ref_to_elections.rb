class AddElectionTypeRefToElections < ActiveRecord::Migration[5.0]
  def change
    add_reference :elections, :election_type, foreign_key: true
  end
end
