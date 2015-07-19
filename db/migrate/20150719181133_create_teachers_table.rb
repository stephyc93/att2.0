class CreateTeachersTable < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :phone
    end
  end
end
