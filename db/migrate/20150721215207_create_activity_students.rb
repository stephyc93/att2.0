class CreateActivityStudents < ActiveRecord::Migration
  def change
    create_table :activity_students do |t|

      t.timestamps null: false
    end
  end
end
