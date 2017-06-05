class CreateElectionUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :election_users do |t|
      t.integer :vote
      t.references :User, foreign_key: true
      t.references :Election, foreign_key: true

      t.timestamps
    end
  end
end
