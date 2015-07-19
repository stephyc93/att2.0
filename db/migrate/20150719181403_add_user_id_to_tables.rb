class AddUserIdToTables < ActiveRecord::Migration
  def change
  	add_column :parents, :user_id, :integer
  	add_column :teachers, :user_id, :integer
  	add_column :students, :user_id, :integer
  	add_foreign_key :parents, :users
  	add_foreign_key :teachers, :users
  	add_foreign_key :students, :users
  end
end
