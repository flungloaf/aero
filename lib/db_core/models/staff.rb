# coding: UTF-8
require 'db_core/models/model'

class Staff < Model
  def self.create_table(connection)
      connection.do("
CREATE TABLE staff(
  id serial PRIMARY KEY,
  first_name text NOT NULL,
  middle_name text NOT NULL,
  last_name text NOT NULL,
  age date,
  post text,
  crew_id integer
) WITH OIDS
        ")
      return true
  end
  def self.table_name()
    return 'staff'
  end

  def initialize(attributes = {})
    @attributes = {
      :id => nil,
      :first_name => nil,
      :middle_name => nil,
      :last_name => nil,
      :age => nil,
      :post => nil,
      :crew_id => nil,
    }
    attributes.each do |k, v|
      @attributes[k] = v
    end
  end
  
    def self.find_all(connection)
    query = []
    res = []
    query = ["SELECT * FROM staff ORDER BY id"]
    connection.select_all(*query) do |r|
      f = self.new
      r.column_names.each do |c|
        f[c.to_sym] = r[c]
      end
      res << f
    end
    return res
  end

  def post
    a={
      '1'=>'пилот',
      '2'=>'стюард',
      '3'=>'бортмеханик',
      '4'=>'второй пилот'
    }
    a[self[:post].to_s]
  end

  def age
    return (DateTime.now.to_date - Date.parse(self[:age].to_s)).to_i/365
  end
  
  def self.find_first(connection, id)
    id = id.to_i
    query = ["SELECT * FROM staff WHERE id = ?", id]
    r = connection.select_one(*query)
    return nil if r.nil?
    f = self.new
    r.column_names.each do |c|
      f[c.to_sym] = r[c]
    end
    return f
  end


end
