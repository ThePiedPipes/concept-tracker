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
  
  def changelog
    email = ReportMailer.create_changelog
    render(:text => "<pre>" + email.encoded + "</pre>")
  end
  
  def reminder
    email = ReportMailer.create_reminder
    render(:text => "<pre>" + email.encoded + "</pre>")
  end



end


