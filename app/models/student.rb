class Student < ActiveRecord::Base
  has_many :activities, :through => :activity_students
  belongs_to :teachers
  belongs_to :parents
end