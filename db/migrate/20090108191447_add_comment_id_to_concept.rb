class AddCommentIdToConcept < ActiveRecord::Migration
  def self.up
    add_column :comments, :concept_id, :integer
  end

  def self.down
    remove_column :comments, :concept_id
  end
end
