require_relative('../models/student.rb')
require("pry")
require_relative('../models/house.rb')

house1 = House.new({
  "name" => "Gryffindor",
  "logo" => "Lion"
  })
house1.save

house2 = House.new({
  "name" => "Hufflepuff",
  "logo" => "Badger"
  })
house2.save

house3 = House.new({
  "name" => "Ravenclaw",
  "logo" => "Eagle"
  })
house3.save

house4 = House.new({
  "name" => "Slytherin",
  "logo" => "Snake"
  })
house4.save

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => "15"
  })
student1.save

student2 = Student.new({
  "first_name" => "Luna",
  "last_name" => "Lovegood",
  "house_id" => house3.id,
  "age" => "15"
  })
student2.save

student3 = Student.new({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house_id" => house4.id,
  "age" => "15"
  })
student3.save

student4 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house_id" => house1.id,
  "age" => "15"
  })
student4.save

student5 = Student.new({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house_id" => house1.id,
  "age" => "15"
  })
student5.save

binding.pry
nil
