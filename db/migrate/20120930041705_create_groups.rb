class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :id
      t.string :name
      t.text :comment
      t.timestamp :created_at

      t.timestamps
    end
  end
end
