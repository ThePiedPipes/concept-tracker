module ConceptsHelper
  
  def select_from_statuses
    statuses = Concept.status_values
    defaults = ["Clarification Needed", "Pending Approval", "In Progress","Completed"]
    select_tag('concept[status]', options_for_select(statuses|defaults))
  end
  
end
