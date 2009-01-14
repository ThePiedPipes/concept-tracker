class RemoveReferencesFromSuggestions < ActiveRecord::Migration
  def self.up
    change_table :suggestions do |t|
      t.remove_references :user
    end
    add_column :suggestions, :user_id, :integer
  end

  def self.down
    remove_column :suggestions, :user_id
  end
end
