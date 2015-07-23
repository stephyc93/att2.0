class ActivitiesStudent < ActiveRecord::Base
  belongs_to :activity
  belongs_to :student

  def self.confirm!(activity, student)
byebug
    activity = ActivitiesStudent.where( :activity_id => activity, :student_id => student.to_i ).first
    activity.update_attributes(:attendance => ['1'])
  end

  # def checked_value
  #   if checkbox == false
  #     checked_value = 1
  #   else checkbox == true
  #     checked_value = 0
  #   end
  # end

end
