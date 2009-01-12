class ReportMailer < ActionMailer::Base
  

  def concept_created(concept, sent_at = Time.now)
    subject    'New Concept Created: '+concept.title
    recipients ["mypipeline@gmail.com"]
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
  
  def changelog(sent_at = Time.now)
    subject   'Changelog for ConceptTracker'
    recipients "mypipeline@gmail.com"
    from      'ConceptTracker'
    sent_on   sent_at    
  end

  def reminder(sent_at = Time.now)
    subject    'Concept Request Reminder'
    recipients "mypipeline@gmail.com" #User.find(:all, :conditions => ['team != ?', "Approvers"])
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'This is a reminder to please create your concept forms by noon today'
  end

end
