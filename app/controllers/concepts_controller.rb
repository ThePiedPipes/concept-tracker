class ConceptsController < ApplicationController
  before_filter :set_concept_status_attribute, :only => [:create, :update]
  
  before_filter :login_required
  
  
  # GET /concepts
  # GET /concepts.xml
  def index
    @concepts = Concept.paginate :page => params[:page], :per_page => 5
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @concepts }
    end
  end

  # GET /concepts/1
  # GET /concepts/1.xml
  def show
    @concept = Concept.find(params[:id])
    @owner = @concept.owner
    @user = current_user
    @comment = Comment.new
    @comments = @concept.comments

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @concept }
    end
  end

  # GET /concepts/new
  # GET /concepts/new.xml
  def new
    @concept = Concept.new
    @owner = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @concept }
    end
  end

  # GET /concepts/1/edit
  def edit
    @concept = Concept.find(params[:id])
  end

  # POST /concepts
  # POST /concepts.xml
  def create
    @concept = Concept.new(params[:concept])
    # make sure that the status is correct
    

    
    
    @concept.owner = current_user
      
    respond_to do |format|
      if @concept.save
        email = ReportMailer.deliver_concept_created(@concept)
        flash[:notice] = 'Concept was successfully created.'
        format.html { redirect_to concept_path(@concept) }
        format.xml  { render :xml => @concept, :status => :created, :location => @concept }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /concepts/1
  # PUT /concepts/1.xml
  def update
    @concept = Concept.find(params[:id])
      
    respond_to do |format|
      if @concept.update_attributes(params[:concept])
        flash[:notice] = 'Concept was successfully updated.'
        format.html { redirect_to(@concept) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /concepts/1
  # DELETE /concepts/1.xml
  def destroy
    @concept = Concept.find(params[:id])
    @concept.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
  
  
  # Comments methods
  def add_comment
    params[:comment][:user_id] = current_user.id
    @concept = Concept.find(params[:id])
    @concept.comments << Comment.create(params[:comment])
    if @concept.save
      flash[:notice] = "Thanks for the comment"
      redirect_to concept_path(@concept)
    end
  end
  
private
    def set_concept_status_attribute
      waiting_on = []
      waiting_on << 'Marketing' unless params[:concept][:consulted_marketing]
      waiting_on << 'Legal' unless params[:concept][:consulted_legal]
      status = waiting_on.empty? ? 'Pending Approval' : "Awaiting #{waiting_on.join(' & ')} Approval"
      @concept.attributes = {:status => status}
    end
  
end
