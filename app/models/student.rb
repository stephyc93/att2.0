class Student < ActiveRecord::Base

  has_many :activities_students
  has_many :activities, through: :activities_students


  belongs_to :teachers
  belongs_to :parents

  def self.without_activity_enrollment(activity_id)
    Student.includes(:activities_students).
      references(:activities_students).
      where.not(activities_students: { activity_id: activity_id})
  end

end