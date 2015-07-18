class AddParentToUsers2 < ActiveRecord::Migration
	def change
		add_column :users, :parent, :integer
	end
end