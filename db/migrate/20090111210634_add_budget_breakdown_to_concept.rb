class AddBudgetBreakdownToConcept < ActiveRecord::Migration
  def self.up
    add_column :concepts, :est_days_dev, :float
    add_column :concepts, :est_days_design, :float
    add_column :concepts, :est_days_ia, :float
    add_column :concepts, :est_days_editorial, :float
    add_column :concepts, :est_days_pm, :float
    add_column :concepts, :est_days_legal, :float
    add_column :concepts, :est_cost_external, :float
  end

  def self.down
    remove_column :concepts, :est_days_design
    remove_column :concepts, :est_days_dev
    remove_column :concepts, :est_days_ia
    remove_column :concepts, :est_days_editorial
    remove_column :concepts, :est_days_pm
    remove_column :concepts, :est_days_legal
    remove_column :concepts, :est_cost_external
  end
end
