class BabysitMailer < ActionMailer::Base
  

  def invite(from_user, to_email)
    subject    'MyBabysit Invitation'
    recipients to_email
    from       'no-reply@mybabysit.com'
    sent_on    Time.now
    
    body       :user => from_user
  end

  def event(event, reply)
    subject    'MyBabysit Event for ' + event.user.last_name
    recipients reply.user.email
    from       'no-reply@mybabysit.com'
    sent_on    Time.now
    
    body       :event => event, :reply => reply
  end

  def reply(event, reply)
    subject    'MyBabysit Reply from ' + reply.user.last_name
    recipients event.user.email
    from       'no-reply@mybabysit.com'
    sent_on    Time.now
    
    body       :event => event, :reply => reply
  end

  def forgot(sent_at = Time.now)
    subject    'You Forgot Your password'
    recipients ''
    from       'no-reply@mybabysit.com'
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

end
