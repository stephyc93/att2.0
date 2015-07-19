class Teacher < ActiveRecord::Base
  has_many :activities
  has_many :students
end