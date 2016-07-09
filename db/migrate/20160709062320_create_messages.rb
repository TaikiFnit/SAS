class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.boolean :attr

      t.timestamps null: false
    end
  end
end
