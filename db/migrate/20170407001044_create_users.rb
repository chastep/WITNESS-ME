class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :username, null: false
      t.string :profile_picture, :default => Faker::Avatar.image
      t.string :password_digest, null: false
      t.string :dwolla_url
      t.string :dwolla_id

      t.timestamps null: false
    end
  end
end
