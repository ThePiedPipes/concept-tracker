class AddColumnsToVersionTable < ActiveRecord::Migration
    def self.up
      add_column :concept_versions, :est_days_dev, :float
      add_column :concept_versions, :est_days_design, :float
      add_column :concept_versions, :est_days_ia, :float
      add_column :concept_versions, :est_days_editorial, :float
      add_column :concept_versions, :est_days_pm, :float
      add_column :concept_versions, :est_days_legal, :float
      add_column :concept_versions, :est_cost_external, :float
      add_column :concept_versions, :objectives, :text
      add_column :concept_versions, :approval_meeting_date, :date
      add_column :concept_versions, :hosted_on_c4, :boolean, :default => true
      add_column :concept_versions, :subject_to_tx, :boolean, :default => false
      add_column :concept_versions, :using_video, :boolean, :default => false
      add_column :concept_versions, :budget_name, :string
      add_column :concept_versions, :traffic_estimate, :string
      add_column :concept_versions, :revenue_estimate, :string
      add_column :concept_versions, :moderation_requirement, :boolean, :default => false
      add_column :concept_versions, :poc_tech, :string
      add_column :concept_versions, :poc_business, :string
    end

    def self.down
      remove_column :concept_versions, :est_days_design
      remove_column :concept_versions, :est_days_dev
      remove_column :concept_versions, :est_days_ia
      remove_column :concept_versions, :est_days_editorial
      remove_column :concept_versions, :est_days_pm
      remove_column :concept_versions, :est_days_legal
      remove_column :concept_versions, :est_cost_external
      remove_column :concept_versions, :poc_business
      remove_column :concept_versions, :poc_tech
      remove_column :concept_versions, :moderation_requirement
      remove_column :concept_versions, :revenue_estimate
      remove_column :concept_versions, :traffic_estimate
      remove_column :concept_versions, :budget_name
      remove_column :concept_versions, :using_video
      remove_column :concept_versions, :subject_to_tx
      remove_column :concept_versions, :hosted_on_c4
      remove_column :concept_versions, :approval_meeting_date
    end
end
