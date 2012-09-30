class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :id
      t.string :name
      t.string :subject
      t.integer :grade
      t.text :description

      t.timestamps
    end
  end
end
