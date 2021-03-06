class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :description, null: false
      t.integer :price, null: false
      t.integer :challenger_id, null: false
      t.integer :acceptor_id, null: false
      t.integer :witness_id
      t.integer :winner_id
      t.integer :loser_id

      t.timestamps null: false
    end
  end
end
