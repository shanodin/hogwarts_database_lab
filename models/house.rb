require_relative('sql_runner')
class House

attr_accessor :name, :logo
attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = '
    INSERT INTO houses
    (name,
    logo)
    values
    ($1, $2)
    RETURNING *
    '
    values = [@name, @logo]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM houses
    WHERE id = $1;"
    house = SqlRunner.run(sql, [id])
    result = House.new(house.first)
    return result
  end

  def self.all()
    sql = "SELECT * FROM houses;"
    houses = SqlRunner.run(sql, [])
    result = houses.map{ |row| House.new(row) }
    return result
  end


end
