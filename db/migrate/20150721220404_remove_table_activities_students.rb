class RemoveTableActivitiesStudents < ActiveRecord::Migration
  def change
    drop_table :activies_students
  end
end
