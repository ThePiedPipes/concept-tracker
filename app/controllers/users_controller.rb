class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @concepts = @user.concepts
  end
  
  def index
    @users = User.find :all
  end
  
  def add_to_admin
    @user = User.find(params[:id])
    @user.give_admin_rights
    if @user.save
      redirect_to :back
    end
  end
  
  def remove_from_admin
    @user = User.find(params[:id])
    @user.remove_admin_rights
    if @user.save
      redirect_to :back
    end
  end

  def add_to_approvers
    @user = User.find(params[:id])
    @user.give_approver_rights
    if @user.save
      redirect_to :back
    end
  end
  
  def remove_from_approvers
    @user = User.find(params[:id])
    @user.remove_approver_rights
    if @user.save
      redirect_to :back
    end
  end

end
