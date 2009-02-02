class Concept < ActiveRecord::Base
  
  #running into problems with new columns not being added even after a server reboot
  # needed to manually add new columns to Versions table
  acts_as_versioned
  
  # associations
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  has_many :comments

  has_attached_file :document
  
  before_save :set_status
  
  # callbacks
  before_create :add_approval_meeting_date
  before_update :validate
  
  # validations
  validates_presence_of :budget, :on => :create, :message => "must have a budget"
  validates_uniqueness_of :title
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :summary, :on => :create, :message => "can't be blank"
  validates_presence_of :deadline, :on => :create, :message => "can't be blank"
  validates_associated :owner, :on => :create
  validates_numericality_of :est_days_dev,
                            :est_days_editorial, 
                            :est_cost_external,
                            :est_days_legal, 
                            :est_days_ia, 
                            :est_days_design,
                            :est_days_pm,
                            :on => :create, :message => "must be a number",
                            :allow_nil => true

  # named scope finders
  # passing in a lamba to get around the fact that 
  # the firt time the class is called, the Date method will be called,
  # meaning a stale time would be kept unintentionally.
  
  named_scope :recently_added, lambda { |*args| {:conditions => ['created_at > ?', args.first || 1.month.ago]} }
  named_scope :last_7_days, lambda { {:conditions => ['created_at > ?', 1.week.ago]} }
  named_scope :unapproved, :conditions => { :status => ["Pending Approval"]}
  named_scope :approved, :conditions => ['status = ?', "Approved"]
  named_scope :completed, :conditions => ['status = ?', "Completed"]
  

  def self.search_by_user_name(name)
    find(:all, :include => :owner, :conditions => ["users.login LIKE ?", "%#{name}%"])
  end
  
  def self.search_by_title(title)
    find(:all, :conditions => ["title LIKE ?", "%#{title}%"])
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
  

  
  # fixme: setting value of these params to true always fails as they
  # are accepting form data, which are strings
  def set_status
    if status.blank?
      if (consulted_legal == true) && (consulted_marketing == true)
          status = "Pending Approval"
      elsif (consulted_legal == true) && (consulted_marketing == false)
        status = "Awaiting Marketing Approval"
      elsif (consulted_legal == false) && (consulted_marketing == true)
        status = "Awaiting Legal Approval"
      elsif (consulted_legal == false) && (consulted_marketing == false)
        status = "Awaiting Marketing & Legal Approval"
      end
    end
    true # Needs to return true for the update to go through    
  end
  
  
end
