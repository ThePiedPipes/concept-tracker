#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---


class TestController < ApplicationController

  def create_concept
    concept = Concept.find :first
    email = ReportMailer.create_concept_created(concept)
    render(:text => "<pre>" + email.encoded + "</pre>")
  end
  
  def weekly_report
    concepts = Concept.find(:all, :conditions => ['created_at >= ?', Date.today])
    email = ReportMailer.create_weekly_report(concepts)
    render(:text => "<pre>" + email.encoded + "</pre>")
  end



end


