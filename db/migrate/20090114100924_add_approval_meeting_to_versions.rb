class AddApprovalMeetingToVersions < ActiveRecord::Migration
  def self.up
    add_column :concept_versions, :approval_meeting, :date
  end

  def self.down
    remove_column :concept_versions, :approval_meeting
  end
end
