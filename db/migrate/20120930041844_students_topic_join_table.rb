class StudentsTopicJoinTable < ActiveRecord::Migration
  def change
    create_table :students_topics, :id => false do |t|
      t.integer :topic_id
      t.integer :student_id
      t.float :perf
    end
  end
end
