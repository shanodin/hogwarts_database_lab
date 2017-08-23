require_relative('../models/student.rb')

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Griffyndor",
  "age" => "15"
  })
student1.save

student2 = Student.new({
  "first_name" => "Luna",
  "last_name" => "Lovegood",
  "house" => "Ravenclaw",
  "age" => "15"
  })
student2.save

student3 = Student.new({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house" => "Slytherin",
  "age" => "15"
  })
student3.save

student4 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house" => "Griffyndor",
  "age" => "15"
  })
student4.save

student5 = Student.new({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house" => "Griffyndor",
  "age" => "15"
  })
student5.save
