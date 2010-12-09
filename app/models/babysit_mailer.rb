class BabysitMailer < ActionMailer::Base
  

  def invite(user)
    subject    'MyBabysit Invitation'
    recipients user.email
    from       'mybabysi@mybabysit.com'
    sent_on    Time.now
    
    body       :user => user
  end

  def event(event, reply)
    subject    'MyBabysit Event for ' + event.user.last_name
    recipients reply.user.email
    from       'mybabysi@mybabysit.com'
    sent_on    Time.now
    
    body       :event => event, :reply => reply
  end

  def reply(event, reply)
    subject    'MyBabysit Reply from ' + reply.user.last_name
    recipients event.user.email
    from       'mybabysi@mybabysit.com'
    sent_on    Time.now
    
    body       :event => event, :reply => reply
  end

  def forgot(sent_at = Time.now)
    subject    'BabysitMailer#forgot'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

end
