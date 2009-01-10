class AddObjectivesToConcept < ActiveRecord::Migration
  def self.up
    add_column :concepts, :objectives, :text
  end

  def self.down
    remove_column :concepts, :objectives
  end
end
