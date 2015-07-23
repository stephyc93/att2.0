class ActivitiesStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :activity

  def self.confirm!(activity, student)
    activity = ActivitiesStudent.where( :activity_id => activity, :student_id => student.to_i ).first
    activity.update_attributes(:attendance => ['1'])
  end

end
