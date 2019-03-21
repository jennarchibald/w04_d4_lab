require_relative ('../db/sql-runner.rb')

class House
  attr_accessor :name, :logo
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = 'INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING id'
    values = [@name, @logo]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.delete_all
    sql = 'DELETE FROM houses'
    SqlRunner.run(sql)
  end
end
