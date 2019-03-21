require_relative ('../db/sql-runner.rb')
require_relative ('./student')

class House
  attr_accessor :name, :logo
  attr_reader :id, :points

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
    @points = options['points'].to_i
  end

  def save()
    sql = 'INSERT INTO houses (name, logo, points) VALUES ($1, $2, $3) RETURNING id'
    values = [@name, @logo, @points]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.delete_all
    sql = 'DELETE FROM houses'
    SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM houses'
    results = SqlRunner.run(sql)
    return results.map {|result| House.new(result)}
  end

  def update()
    sql = 'UPDATE houses SET (name, logo, points) = ($1, $2, $3) WHERE id = $4'
    values = [@name, @logo, @points, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM houses WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = 'SELECT * FROM houses WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values).first
    return House.new(result)
  end

  def students()
    sql = 'SELECT * FROM students WHERE house_id = $1'
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map {|hash| Student.new(hash)}
  end

  def add_or_remove_points(new_points)
    @points += new_points.to_i
    @points = 0 if @points < 0
    self.update
  end

  # def remove_points(lost_points)
  #   if @points > lost_points
  #     @points -= lost_points
  #   else
  #     @points = 0
  #   end
  #   self.update
  # end
end
