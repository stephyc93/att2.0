class ActivitiesStudent < ActiveRecord::Base
  belongs_to :activity
  belongs_to :student
end
