class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :pseudonyme
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :address
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
