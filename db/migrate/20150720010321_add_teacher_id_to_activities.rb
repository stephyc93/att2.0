class AddTeacherIdToActivities < ActiveRecord::Migration
  def change
  	add_column :activities, :teacher_id, :integer
  	add_foreign_key :activities, :teachers
  end
end
