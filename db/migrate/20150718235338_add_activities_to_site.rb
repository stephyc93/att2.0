class AddActivitiesToSite < ActiveRecord::Migration
  def change
  	create_table :activities do |t|
     t.string :name
     t.datetime :start
     t.datetime :end
     t.string :location
     t.integer :permission_slip
   end

   create_table :activies_students, id: false do |t|
     t.belongs_to :activity, index: true
     t.belongs_to :student, index: true
     t.integer :present
   end
  end
end
