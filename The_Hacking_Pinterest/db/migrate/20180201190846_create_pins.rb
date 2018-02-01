class CreatePins < ActiveRecord::Migration[5.1]
  def change
    create_table :pins do |t|
      t.text :img_link
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
