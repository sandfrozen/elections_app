class CreateElections < ActiveRecord::Migration[5.0]
  def change
    create_table :elections do |t|
      t.string :name
      t.text :info
      t.datetime :start
      t.datetime :end
      t.integer :max_votes

      t.timestamps
    end
  end
end
