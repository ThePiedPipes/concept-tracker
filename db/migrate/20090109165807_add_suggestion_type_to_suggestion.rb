class AddSuggestionTypeToSuggestion < ActiveRecord::Migration
  def self.up
    add_column :suggestions, :issue_type, :string
  end

  def self.down
    remove_column :suggestions, :issue_type
  end
end
