class Concept < ActiveRecord::Base
  acts_as_versioned
  
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  has_many :comments
  
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
                            :on => :create, :message => "is not a number"
  
  def self.status_values
    count(:all, :group => 'status').reject! { |i, e| i.blank? }.collect { |i,e| i}
  end
  
end
