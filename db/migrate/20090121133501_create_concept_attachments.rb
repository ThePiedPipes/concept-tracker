class CreateConceptAttachments < ActiveRecord::Migration
  def self.up
    create_table :concept_attachments do |t|
      t.column "content_type", :string
      t.column "filename", :string     
      t.column "size", :integer
      
      # used with thumbnails, always required
      t.column "parent_id",  :integer 
      t.column "thumbnail", :string
      
    end
  end

  def self.down
    drop_table :concept_attachments

  end
end
