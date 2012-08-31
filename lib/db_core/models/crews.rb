# coding: UTF-8
require 'db_core/models/model'

class Crews < Model
  def self.create_table(connection)
      connection.do("
CREATE TABLE crews(
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE,
  available_at timestamp,
  location text
) WITH OIDS
        ")
      return true
  end
  def self.table_name()
    return 'crews'
  end

  def initialize(attributes = {})
    @attributes = {
      :id => nil,
      :name => nil,
      :available_at => nil,
      :location => nil,
    }
    attributes.each do |k, v|
      @attributes[k] = v
    end
  end
  
    def self.find_all(connection)
    query = []
    res = []
    query = ["SELECT * FROM crews ORDER BY id"]
    connection.select_all(*query) do |r|
      f = self.new
      r.column_names.each do |c|
        f[c.to_sym] = r[c]
      end
      res << f
    end
    return res
  end

  def self.find_first(connection, id)
    id = id.to_i
    query = ["SELECT * FROM crews WHERE id = ?", id]
    r = connection.select_one(*query)
    return nil if r.nil?
    f = self.new
    r.column_names.each do |c|
      f[c.to_sym] = r[c]
    end
    return f
  end


end
