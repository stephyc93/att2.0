class AddColumnsToActivityStudents < ActiveRecord::Migration
  def change
    add_column :activity_students, :student_id, :integer
    add_column :activity_students, :activity_id, :integer
    add_column :activity_students, :attendance , :integer, array: true, default: []
  end
end
