require_relative("../db/sql_runner.rb")

class House

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = " INSERT INTO houses (name)
    VALUES ($1) RETURNING *"
    values = [@name]
    house_data = SqlRunner.run(sql,values)
    @id = house_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE houses SET name =
   ($1) WHERE id = $2 "
    values = [@name, @id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM houses WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end
  def self.id(name)
    sql = "SELECT id FROM houses where name = $1"
    values = [name]
    result = SqlRunner.run(sql,values).first
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql,values).first
    result = House.new(house)
    return result
  end

  def self.all()
    sql = " SELECT * FROM houses "
    houses = SqlRunner.run(sql)
    result = houses.map{|house|House.new(house)}
    return result
  end


end
