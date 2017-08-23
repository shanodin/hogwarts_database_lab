require_relative('sql_runner')
class Student

  attr_accessor :first_name, :last_name, :house, :age
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def save()
    sql = "
      INSERT INTO students
        (first_name,
        last_name,
        house,
        age)
      VALUES
        ($1, $2, $3, $4)
      RETURNING *
    "
    values = [@first_name, @last_name, @house, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
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

















end