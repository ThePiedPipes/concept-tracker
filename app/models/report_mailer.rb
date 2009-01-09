class ReportMailer < ActionMailer::Base
  

  def concept_created(concept, sent_at = Time.now)
    subject    'New Concept Created: '+concept.title
    recipients ["mypipeline@gmail.com","pgsteward@channel4.co.uk"]
    from       'ConceptTracker v0.1'
    sent_on    sent_at
    
    body       :concept => concept
  end
  
  def weekly_report(concepts, sent_at = Time.now)
    subject    'Weekly Concepts Summary '
    recipients "pgsteward@channel4.co.uk"
    from       'ConceptTracker v0.1'
    sent_on    sent_at
    
    body       :concepts => concepts
  end

  def reminder_all(sent_at = Time.now)
    subject    'Concept Request Reminder'
    recipients User.find(:all, :conditions => ['team != ?', "Approvers"])
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'This is a reminder to please create your concept forms by noon today'
  end

end
