class CreateParentsAndStudents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :name
      t.string :phone
    end

    create_table :students do |t|
      t.string :name
      t.string :phone
    end

    create_table :parents_students, id: false do |t|
     t.belongs_to :parent, index: true
     t.belongs_to :student, index: true
    end
  end
end
