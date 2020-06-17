require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.
require "byebug"
class SQLObject
  def self.columns
    @columns ||= []
    if @columns.length == 0
      result = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
      SQL
      @columns = result.first.map {|col| col.to_sym}
    end
    @columns
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do
        attributes[col]
      end
      define_method("#{col}=") do |val|
        attributes[col] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
      SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    new_results = results.map do |result|
      self.new(result)
    end
    new_results
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL,id)
        SELECT
          *
        FROM
          #{self.table_name}
        WHERE
          id = ?
      SQL
    return nil if results.length <= 0
    self.new(results.first)
  end

  def initialize(params = {})
   
      params.each do |attr_name,value|
        if !self.class.columns.include?(attr_name.to_sym)
          raise "unknown attribute '#{attr_name}'" 
        else     
          self.send("#{attr_name}=",value)
        end
      end
    
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    values = []
    self.attributes.each do |attr_name, value|
      values << self.send(attr_name)
    end
    values
  end

  def insert
    col_names = self.class.columns[1..-1].map(&:to_s).join(',')
    new_values = (["?"]*(self.class.columns.length-1)).join(',')
    DBConnection.execute(<<-SQL, self.attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{new_values})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    
    update_cols = self.class.columns[1..-1].map {|col| "#{col} = ?"}.join(',')
    DBConnection.execute(<<-SQL, self.attribute_values[1..-1], self.id)
      UPDATE
         #{self.class.table_name}
      SET
        #{update_cols}
      WHERE
        id = ?
    SQL
  end

  def save
    if self.id != nil
      update
    else  
      insert
    end
  end
end
