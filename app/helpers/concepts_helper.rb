module ConceptsHelper
  
  def select_from_statuses
    defaults = ["Clarification Needed", "Pending Approval", "In Progress","Completed"]
    select_tag('concept[status]', options_for_select(defaults))
  end
  
  def select_from_verticals
    defaults = ["Homes", "Food", "4Car","Programmes","Blogs","E4","X-Platform","News"]
    select_tag('concept[vertical]', options_for_select(defaults.sort))
  end
  
  def total_resource_days
    Concept.find(params[:id]).total_resource_days
  end
  
end
