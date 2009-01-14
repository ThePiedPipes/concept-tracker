class ChangeApprovalDate < ActiveRecord::Migration
  def self.up
    rename_column :concepts, :approval_meeting_date, :approval_meeting
  end

  def self.down
    rename_column :concepts, :approval_meeting, :approval_meeting_date
  end
end
