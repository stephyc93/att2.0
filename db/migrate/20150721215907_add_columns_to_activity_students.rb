class AddColumnsToActivityStudents < ActiveRecord::Migration
  def change
    add_column :activities_students, :student_id, :integer
    add_column :activities_students, :activity_id, :integer
    add_column :activities_students, :attendance , :integer
  end
end
