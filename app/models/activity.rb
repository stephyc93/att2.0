class Activity < ActiveRecord::Base
  belongs_to :teachers
  has_many :students
   
end
