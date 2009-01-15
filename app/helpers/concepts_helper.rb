module ConceptsHelper
  
  def select_from_statuses
    defaults = ["Clarification Needed", "Pending Approval", "In Progress","Completed"]
    select_tag('concept[status]', options_for_select(defaults))
  end
  
  def total_resource_days
    Concept.find(params[:id]).total_resource_days
  end
  
end
