require_relative("../models/student")
require_relative("../models/house")
require("pry-byebug")

House.delete_all()
Student.delete_all()

house1 = House.new({
  "name" => "Gryffindor"
  })

  house2 = House.new({
    "name" => "Slytherin"
    })

    house3 = House.new({
      "name" => "Ravenclaw"
      })

      house4 = House.new({
        "name" => "Hufflepuff"
        })
house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 16
  })

  student2 = Student.new({
    "first_name" => "Hermione",
    "last_name" => "Granger",
    "house_id" => house1.id,
    "age" => 16
    })

    student3 = Student.new({
      "first_name" => "Draco",
      "last_name" => "Malfoy",
      "house_id" => house2.id,
      "age" => 16
      })

  student1.save()
  student2.save()
  student3.save()

binding.pry()
nil
