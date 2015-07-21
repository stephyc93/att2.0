class Activity < ActiveRecord::Base
  belongs_to :teachers
  has_many :activity_students
  has_many :students, :through => :activity_students
end
