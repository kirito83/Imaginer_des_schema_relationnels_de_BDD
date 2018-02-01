class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :pseudonyme
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :cours, foreign_key: true

      t.timestamps
    end
  end
end
