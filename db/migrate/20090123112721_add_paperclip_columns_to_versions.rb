class AddPaperclipColumnsToVersions < ActiveRecord::Migration
  def self.up
    add_column :concept_versions, :document_file_name, :string
    add_column :concept_versions, :document_content_type, :string
    add_column :concept_versions, :document_file_size, :integer
    add_column :concept_versions, :document_updated_at, :datetime
  end

  def self.down
    remove_column :concept_versions, :document_file_name
    remove_column :concept_versions, :document_content_type
    remove_column :concept_versions, :document_file_size
    remove_column :concept_versions, :document_updated_at
  end
end
