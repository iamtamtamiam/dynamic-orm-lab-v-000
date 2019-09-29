require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  
  def self.table_name
    self.to_s.downcase.pluralize
  end
  
  def self.column_names
    DB[:conn].results_as_hash = true
 
    sql = "PRAGMA table_info('#{table_name}')"
    column_names = []
    table_info = DB[:conn].execute(sql).each do |column|
      column_names << column["name"]
    end
    column_names.compact
  end 
  
  self.column_names.each do |col|
    attr_accessor col.to_sym
  end 
  
  def initialize(options=[])
    
  end 
  
end