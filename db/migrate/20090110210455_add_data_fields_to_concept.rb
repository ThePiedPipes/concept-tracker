class AddDataFieldsToConcept < ActiveRecord::Migration
  def self.up
    add_column :concepts, :approval_meeting_date, :date
    add_column :concepts, :hosted_on_c4, :boolean, :default => true
    add_column :concepts, :subject_to_tx, :boolean, :default => false
    add_column :concepts, :using_video, :boolean, :default => false
    add_column :concepts, :budget_name, :string
    add_column :concepts, :traffic_estimate, :string
    add_column :concepts, :revenue_estimate, :string
    add_column :concepts, :moderation_requirement, :boolean, :default => false
    add_column :concepts, :poc_tech, :string
    add_column :concepts, :poc_business, :string
  end

  def self.down
    remove_column :concepts, :poc_business
    remove_column :concepts, :poc_tech
    remove_column :concepts, :moderation_requirement
    remove_column :concepts, :revenue_estimate
    remove_column :concepts, :traffic_estimate
    remove_column :concepts, :budget_name
    remove_column :concepts, :using_video
    remove_column :concepts, :subject_to_tx
    remove_column :concepts, :hosted_on_c4
    remove_column :concepts, :approval_meeting_date
  end
end