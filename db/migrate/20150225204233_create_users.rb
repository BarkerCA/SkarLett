class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :enabled
      t.string :password_hash
      t.string :password_salt

      t.timestamps null: false
    end
  end
end
