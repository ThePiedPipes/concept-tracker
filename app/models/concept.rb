class Concept < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  has_many :comments
  
  before_update :validate
  
  validates_presence_of :title, :on => :create, :message => "Title can't be blank"
  validates_presence_of :summary, :on => :create, :message => "Summary can't be blank"
  
  validates_presence_of :deadline, :on => :create, :message => "Deadline can't be blank"
  validates_associated :owner, :on => :create
  
end
