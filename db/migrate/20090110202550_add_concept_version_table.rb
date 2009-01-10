class AddConceptVersionTable < ActiveRecord::Migration
  def self.up
    Concept.create_versioned_table
  end

  def self.down
    Concept.drop_versioned_table
  end
end
