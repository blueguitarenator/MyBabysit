require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def test_should_have_working_associations
    assert_working_associations
  end
  
  def test_should_load_babysitter_attributes
    amanda = Factory(:amanda)
    assert_equal("Amanda", amanda.first_name)
    assert_equal("Barker", amanda.last_name)
    assert_equal("amanda@msn.com", amanda.email)
    assert_equal("babysitter", amanda.accttype)
  end
  
  def test_should_load_babysitter_attributes
    rich = Factory(:rich)
    assert_equal("Rich", rich.first_name)
    assert_equal("Johnson", rich.last_name)
    assert_equal("rich@msn.com", rich.email)
    assert_equal("parent", rich.accttype)
  end
  
  def test_should_delete_one_babysitter
    morgan = Factory(:morgan)
    assert_difference 'User.count', -1 do
      morgan.destroy
    end  
  end

  def test_should_create_one_babysitter
    assert_difference 'User.count' do
      User.create(
        :last_name => 'Smith', 
        :first_name => 'Mary', 
        :email => 'mary@msn.com',
        :accttype => 'babysitter',
        :password => 'asdf',
        :password_confirmation => 'asdf')
    end
  end

  def test_should_associate_babysitter_with_parent
    amanda = Factory(:amanda)
    morgan = Factory(:morgan)
    rich = Factory(:rich)
    rich.add_friend(amanda)
    rich.add_friend(morgan)
    assert_equal(2, rich.friends.count)
    assert_equal(1, amanda.friends.count)
    assert_equal(1, morgan.friends.count)
  end

  def test_should_associate_parent_with_babysitter
    amanda = Factory(:amanda)
    kristy = Factory(:kristy)
    rich = Factory(:rich)
    amanda.add_friend(rich)
    amanda.add_friend(kristy)
    assert_equal(2, amanda.friends.count)
    assert_equal(1, rich.friends.count)
    assert_equal(1, kristy.friends.count)
  end

  def test_can_add_reply
    amanda = Factory(:amanda)
    assert_difference 'amanda.replies.count' do
      Reply.create(
        :event_id => 3,
        :user_id => amanda.id,
        :answer => 'Yes',
        :note => 'asdf'
        )
    end
  end

  def test_babysitter_can_see_their_events
    amanda = Factory(:amanda)
    wedding = Factory(:wedding)
    dinner = Factory(:dinner)
    amandaDinnerReply = Reply.create(:event_id => dinner.id, :user_id => amanda.id, :answer => 'Yes', :note => 'k')
    amandaWeddingReply = Reply.create(:event_id => wedding.id, :user_id => amanda.id, :answer => 'No', :note => 'sorry')
    
    assert_equal(2, amanda.replies.count)

    events = amanda.replies.collect{|r| r.event}
    assert_equal(2, events.count)
    assert_equal("Dinner", events[0].name)
    assert_equal("Wedding", events[1].name)
  end
end
