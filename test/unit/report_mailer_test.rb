require 'test_helper'

class ReportMailerTest < ActionMailer::TestCase
  tests ReportMailer
  def test_concept_created
    @expected.subject = 'ReportMailer#concept_created'
    @expected.body    = read_fixture('concept_created')
    @expected.date    = Time.now

    assert_equal @expected.encoded, ReportMailer.create_concept_created(@expected.date).encoded
  end

  def test_reminder
    @expected.subject = 'ReportMailer#reminder'
    @expected.body    = read_fixture('reminder')
    @expected.date    = Time.now

    assert_equal @expected.encoded, ReportMailer.create_reminder(@expected.date).encoded
  end

end
