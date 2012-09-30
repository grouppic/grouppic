class StudentsGroupJoinTable < ActiveRecord::Migration
  def change
    create_table :groups_students, :id => false do |t|
      t.integer :group_id
      t.integer :student_id
      t.float :perf
    end
  end
end
