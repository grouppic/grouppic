class Group < ActiveRecord::Base
  attr_accessible :comment, :created_at, :id, :name
  has_and_belongs_to_many :students
end
