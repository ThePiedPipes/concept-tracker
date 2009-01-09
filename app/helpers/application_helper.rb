# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def link_to_next_concept
    con = Concept.find(:first, :conditions => ['created_at > ?', @concept.created_at])
    link_to("Next: "+con.title, concept_path(con)) unless !con
  end
  
  def link_to_previous_concept
    con = Concept.find(:first, :conditions => ['created_at < ?', @concept.created_at])
    link_to("Prev: "+con.title, concept_path(con)) unless !con
  end
  
end
