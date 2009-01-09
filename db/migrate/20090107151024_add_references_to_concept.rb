class AddReferencesToConcept < ActiveRecord::Migration
  def self.up
    add_column :concepts, :user_id, :integer
  end

  def self.down
    remove_column :concepts, :user_id
  end
end
