class DropAttachments < ActiveRecord::Migration
  def self.up
    drop_table :concept_attachments
  end

  def self.down
  end
end
