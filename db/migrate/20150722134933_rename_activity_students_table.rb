class RenameActivityStudentsTable < ActiveRecord::Migration
  def change
  	rename_table :activity_students, :activities_students
  end
end
