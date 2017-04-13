class CreateElectionCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :election_candidates do |t|
      t.string :party
      t.integer :list
      t.integer :place
      t.references :User, foreign_key: true
      t.references :Election, foreign_key: true

      t.timestamps
    end
  end
end
