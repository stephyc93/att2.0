class ChangeAttendanceToInteger < ActiveRecord::Migration
  def change
  	change_column :activities_students, :attendance , :integer, array: false
  end
end
