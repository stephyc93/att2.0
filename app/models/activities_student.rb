class ActivitiesStudent < ActiveRecord::Base
  belongs_to :activity
  belongs_to :student

  # def checked_value
  #   if checkbox == false
  #     checked_value = 1
  #   else checkbox == true
  #     checked_value = 0
  #   end
  # end

end
