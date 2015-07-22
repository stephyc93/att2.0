class Activity < ActiveRecord::Base
  belongs_to :teachers
  # has_and_belongs_to_many :students
  has_many :activities_students
  has_many :students, through: :activities_students
end
