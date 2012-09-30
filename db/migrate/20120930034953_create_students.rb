class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :id
      t.string :name
      t.integer :grade
      t.float :gpa

      t.timestamps
    end
  end
end
