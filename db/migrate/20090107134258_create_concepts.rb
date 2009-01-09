class CreateConcepts < ActiveRecord::Migration
  def self.up
    create_table :concepts do |t|
      t.string :title
      t.text :summary
      t.boolean :consulted_legal, :default => false
      t.boolean :consulted_marketing, :default => false
      t.boolean :design_needed, :default => false
      t.string :vertical
      t.string :status
      t.date :deadline, :null => false
      t.decimal :budget, :precision => 6, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :concepts
  end
end
