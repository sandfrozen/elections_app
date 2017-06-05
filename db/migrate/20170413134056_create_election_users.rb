class CreateElectionUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :election_users do |t|
      t.integer :vote
      t.references :User_id, foreign_key: true
      t.references :Election_id, foreign_key: true

      t.timestamps
    end
  end
end
