require 'test_helper'

class BabysitMailerTest < ActionMailer::TestCase
  def setup
    @rich = Factory(:rich)
    @amanda = Factory(:amanda)
    @dinner = Factory(:dinner)
    @re = Factory(:yes_reply)
    @dinner.user_id = @rich.id
    @re.event_id = @dinner.id
    @re.user_id = @amanda.id
    ActionMailer::Base.deliveries = []
  end

  def test_invite_mail
    BabysitMailer.deliver_invite(@rich, "amanda@msn.com")
    assert !ActionMailer::Base.deliveries.empty?

    sent = ActionMailer::Base.deliveries.first
    assert_equal [@amanda.email], sent.to
    assert_equal "MyBabysit Invitation", sent.subject
    assert sent.body =~ /is inviting you to check out www.mybabysit.com to schedule babysitter jobs easily using automatic email notifications./
    assert sent.body =~ /#{@rich.first_name}/ 
    assert sent.body =~ /#{@rich.last_name}/
  end

  def test_event_mail
    BabysitMailer.deliver_event(@dinner, @re)
    assert !ActionMailer::Base.deliveries.empty?

    sent = ActionMailer::Base.deliveries.first
    assert_equal [@amanda.email], sent.to
    assert_equal "MyBabysit Event for #{@rich.last_name}", sent.subject
    assert sent.body =~ /^Dear #{@re.user.first_name}/
    assert sent.body =~ /#{@rich.first_name}/ 
    assert sent.body =~ /#{@rich.last_name}/
    assert sent.body =~ /has sent you a babysit job for/
    assert sent.body =~ /#{@dinner.eventDate}/ 
    assert sent.body =~ /#{@dinner.startTime}/
    assert sent.body =~ /#{@dinner.endTime}/ 
    assert sent.body =~ /Login at www.mybabysit.com to make your reply!/
  end

  def test_reply_mail
    BabysitMailer.deliver_reply(@dinner, @re)
    assert !ActionMailer::Base.deliveries.empty?

    sent = ActionMailer::Base.deliveries.first
    assert_equal [@rich.email], sent.to
    assert_equal "MyBabysit Reply from #{@amanda.last_name}", sent.subject
    assert sent.body =~ /^Dear #{@dinner.user.first_name}/
    assert sent.body =~ /You have received a reply from/ 
    assert sent.body =~ /#{@amanda.first_name}/
    assert sent.body =~ /#{@amanda.last_name}/
    assert sent.body =~ /for the event/
    assert sent.body =~ /#{@dinner.name}/ 
    assert sent.body =~ /Answer is: #{@re.answer}/
  end

  def test_forgot_mail
  end

end
