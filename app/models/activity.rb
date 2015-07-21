class Activity < ActiveRecord::Base
  belongs_to :teachers
  has_many :students, through: :activity_students
   
   
end
