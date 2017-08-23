require_relative('sql_runner')
require_relative('house')
class Student

  attr_accessor :first_name, :last_name, :age, :house_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def save()
    sql = "
      INSERT INTO students
        (first_name,
        last_name,
        house_id,
        age)
      VALUES
        ($1, $2, $3, $4)
      RETURNING *
    "
    values = [@first_name, @last_name, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  # def self.map_items(rows)
  #   return rows.map { |row| Student.new(row) }
  # end

  def self.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run(sql, [])
    result = students.map{ |row| Student.new(row) }
    return result
  end

  def delete()
    sql = "DELETE FROM students
    WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end

  def self.find(id)
    sql = "SELECT * FROM students
    WHERE id = $1;"
    student = SqlRunner.run(sql, [id])
    result = Student.new(student.first)
    return result
  end

  def house()
    sql = "
      SELECT * FROM houses
      WHERE id = $1;
    "
    results_array = SqlRunner.run(sql, [@house_id])
    house_hash = results_array[0]
    house_object = House.new(house_hash)
    return house_object
  end

  def update()
    sql = "
      UPDATE students SET
        (first_name,
        last_name,
        house_id,
        age)
      =
        ($1, $2, $3, $4)
      WHERE id = $5;
    "
    values = [@first_name, @last_name, @house_id, @age, @id]
    SqlRunner.run(sql, values)
  end




end
