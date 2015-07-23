class Activity_Student < ActiveRecord::Base
  belongs_to :activities
  has_many :students
end
