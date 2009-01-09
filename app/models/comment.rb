class Comment < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :body, :on => :create, :message => "Can't be blank"
end
