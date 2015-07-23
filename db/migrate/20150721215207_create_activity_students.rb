class CreateActivityStudents < ActiveRecord::Migration
  def change
    create_table :activities_students do |t|

      t.timestamps null: false
    end
  end
end
