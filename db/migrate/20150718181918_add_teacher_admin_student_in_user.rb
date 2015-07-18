class AddTeacherAdminStudentInUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :integer
    add_column :users, :teacher, :integer
    add_column :users, :student, :integer
  end
end
