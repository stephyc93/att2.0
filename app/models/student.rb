class Student < ActiveRecord::Base
  # has_and_belongs_to_many :activities
  has_many :activities_students
  has_many :activities, through: :activities_students
  belongs_to :teachers
  belongs_to :parents
end