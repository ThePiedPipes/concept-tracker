class Concept < ActiveRecord::Base
  
  #running into problems with new columns not being added even after a server reboot
  acts_as_versioned
  
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  has_many :comments
  
  before_create :add_approval_meeting_date
  
  before_update :validate
  
  validates_presence_of :title, :on => :create, :message => "Title can't be blank"
  validates_presence_of :summary, :on => :create, :message => "Summary can't be blank"
  
  validates_presence_of :deadline, :on => :create, :message => "Deadline can't be blank"
  validates_associated :owner, :on => :create
  
  validates_numericality_of :est_days_dev,
                            :est_days_editorial, 
                            :est_cost_external,
                            :est_days_legal, 
                            :est_days_ia, 
                            :est_days_design,
                            :est_days_pm,
                            :on => :create, :message => "Must be a number",
                            :if => :est_days_dev?
  
                            
  def self.status_values
    count(:all, :group => 'status').reject! { |i, e| i.blank? }.collect { |i,e| i}
  end
  
  def add_approval_meeting_date
    case Date.today.wday
    when 1
      date = Date.today+2
    when 2
      date = Date.today+1
    when 3
      date = Date.today
    when 4
      date = Date.today+6
    when 5
      date = Date.today+5
    when 6
      date = Date.today+4
    when 7
      date = Date.today+3
    end
    self.attributes = {:approval_meeting => date }
  end
  
  def budget_after_costs
    if !budget.blank?
      budget - est_cost_external
    end
  end
  
  def total_resource_days
    costs = [est_days_dev, est_days_editorial, est_days_design, est_days_ia, est_days_pm]
    unless costs.each { |e| e.blank? }
      self.est_days_dev + self.est_days_editorial + self.est_days_design + self.est_days_ia + self.est_days_pm
    end
  end
  
end
