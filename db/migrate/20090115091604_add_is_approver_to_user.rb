class AddIsApproverToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :is_approver, :boolean, :default => false
    p = User.create(:login => "pgsteward", :email => "pgsteward@channel4.co.uk", :is_admin => true, :is_approver => true, :team => 'FMS')
    p.save
    
    l = User.create(:login => "lshepherd", :email => "lshepherd@channel4.co.uk", :is_admin => true, :is_approver => true, :team => 'FMS')
    l.save
  end

  def self.down
    remove_column :users, :is_approver
  end
end
