class AdminController < ApplicationController
  def dashboard
    @users = User.find(:all, :order => 'login DESC')
    @concepts_awaiting_approval = Concept.unapproved
  end

  def users
    @users = User.find(:all, :order => 'login DESC')
  end

  def concepts
    @concepts = Concept.find(:all, :order => 'created_at DESC')
  end

end
