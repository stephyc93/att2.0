class Student < ActiveRecord::Base

  has_many :activity_students
  has_many :activities, through: :activity_students

  belongs_to :teachers
  belongs_to :parents

  def self.without_activity_enrollment(activity_id)
    Student.includes(:activity_students).
      references(:activity_students).
      where.not(activity_students: { activity_id: activity_id})
  end

end