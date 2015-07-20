class Teacher < ActiveRecord::Base
  has_many :activities
  has_many :students, through: :activities
end