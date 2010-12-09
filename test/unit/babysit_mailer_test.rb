require 'test_helper'

class BabysitMailerTest < ActionMailer::TestCase
  test "invite" do
    @expected.subject = 'BabysitMailer#invite'
    @expected.body    = read_fixture('invite')
    @expected.date    = Time.now

    assert_equal @expected.encoded, BabysitMailer.create_invite(@expected.date).encoded
  end

  test "event" do
    @expected.subject = 'BabysitMailer#event'
    @expected.body    = read_fixture('event')
    @expected.date    = Time.now

    assert_equal @expected.encoded, BabysitMailer.create_event(@expected.date).encoded
  end

  test "reply" do
    @expected.subject = 'BabysitMailer#reply'
    @expected.body    = read_fixture('reply')
    @expected.date    = Time.now

    assert_equal @expected.encoded, BabysitMailer.create_reply(@expected.date).encoded
  end

  test "forgot" do
    @expected.subject = 'BabysitMailer#forgot'
    @expected.body    = read_fixture('forgot')
    @expected.date    = Time.now

    assert_equal @expected.encoded, BabysitMailer.create_forgot(@expected.date).encoded
  end

end
