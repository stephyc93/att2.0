class Activity < ActiveRecord::Base
  belongs_to :teachers

  has_many :activities_students
  has_many :students, through: :activities_students
   
   

end
