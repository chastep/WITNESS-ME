class CreateHandshakes < ActiveRecord::Migration[5.0]
  def change
    create_table :handshakes do |t|
      t.integer :challenge_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
