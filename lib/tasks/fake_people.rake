require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task fake_students: :environment do
    20.times do |n|
      puts "[DEBUG] creating user #{n+1} of 10"
      fullname = Faker::Name.name
      email = "students-#{n+1}@example.com"
      student = '1'
      password = "password"
      User.create!( fullname: fullname,
                    email: email,
                    student: student,
                    password: password,
                    password_confirmation: password)
    end
  end

  task fake_teachers: :environment do
    20.times do |n|
      puts "[DEBUG] creating user #{n+1} of 10"
      fullname = Faker::Name.name
      email = "teachers-#{n+1}@example.com"
      teacher = '1'
      password = "password"
      User.create!( fullname: fullname,
                    email: email,
                    teacher: teacher,
                    password: password,
                    password_confirmation: password)
    end
  end

  task fake_parents: :environment do
    20.times do |n|
      puts "[DEBUG] creating user #{n+1} of 10"
      fullname = Faker::Name.name
      email = "parents-#{n+1}@example.com"
      parent = '1'
      password = "password"
      User.create!( fullname: fullname,
                    email: email,
                    parent: parent,
                    password: password,
                    password_confirmation: password)
    end
  end

end