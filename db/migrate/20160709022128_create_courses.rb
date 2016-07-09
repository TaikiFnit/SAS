class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.boolean :permission
      t.string :resume

      t.timestamps null: false
    end
  end
end
