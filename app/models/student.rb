class Student < ActiveRecord::Base
  has_many :activities
  belongs_to :teachers
  belongs_to :parents
end