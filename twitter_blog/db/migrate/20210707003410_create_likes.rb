class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      # t.integer :number
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
