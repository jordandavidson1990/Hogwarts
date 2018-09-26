require_relative("../db/sql_runner.rb")
require_relative("./house")

class Student

  attr_accessor :first_name, :last_name, :house_id, :age
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @house_id = options["house_id"].to_i if options["house_id"]
    @age = options["age"].to_i
  end

  def save()
    sql = " INSERT INTO students (first_name, last_name, house_id, age)
    VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @house_id, @age]
    student_data = SqlRunner.run(sql,values)
    @id = student_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE students SET (first_name, last_name, house_id, age) =
   ($1, $2, $3, $4) WHERE id = $5 "
    values = [@first_name, @last_name, @house_id, @age, @id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM students WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@house_id]
    result = SqlRunner.run(sql,values).first
    house = House.new(result)
    return house
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql,values).first
    result = Student.new(student)
    return result
  end

  def self.all()
    sql = " SELECT * FROM students "
    student = SqlRunner.run(sql)
    result = student.map{|student|Student.new(student)}
    return result
  end


end
