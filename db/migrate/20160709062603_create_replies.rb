class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :body
      t.references :user, index: true, foreign_key: true
      t.references :message, index: true, foreign_key: true
      t.integer :value

      t.timestamps null: false
    end
  end
end
