require_relative ('../db/sql-runner.rb')
class Student
  attr_accessor :first_name, :last_name, :house_id, :age
  attr_reader :id

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def save()
    sql = 'INSERT INTO students (first_name, last_name, house_id, age) VALUES ($1, $2, $3, $4) RETURNING id'
    values = [@first_name, @last_name, @house_id, @age]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM students'
    results = SqlRunner.run(sql)
    return results.map {|result| Student.new(result)}
  end

  def self.delete_all()
    sql = 'DELETE FROM students'
    SqlRunner.run(sql)
  end

  def update()
    sql = 'UPDATE students SET (first_name, last_name, house_id, age) = ($1, $2, $3, $4) WHERE id = $5'
    values =[@first_name, @last_name, @house_id, @age, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM students WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = 'SELECT * FROM students WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Student.new(result)
  end

end
