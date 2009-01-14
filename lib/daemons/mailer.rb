#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "production"

require File.dirname(__FILE__) + "/../../config/environment"

$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do
  
  if Time.now.wday == 3 && Time.now.hour == 9 && Time.now.min == 0 && Time.now.sec == 0
    ReportMailer.deliver_weekly_report
    ActiveRecord::Base.logger.info "Weekly report delivered at #{Time.now}.\n"
  else
  sleep 10
  end
end