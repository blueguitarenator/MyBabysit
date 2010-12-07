require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def test_should_have_working_associations
    assert_working_associations
  end
  
  def test_should_load_babysitter_attributes
    assert_equal 1, users(:amanda).id
    assert_equal users(:amanda), User.find(1)
    amanda = users(:amanda)
    assert_equal("Amanda", amanda.first_name)
    assert_equal("Barker", amanda.last_name)
    assert_equal("amanda@msn.com", amanda.email)
    assert_equal("babysitter", amanda.accttype)
    assert_equal 2, users(:morgan).id
    assert_equal User.find(2), users(:morgan)
  end
    def test_should_delete_one_babysitter
      assert_difference 'User.count', -1 do
        users(:morgan).destroy
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
          :password_confirmation => 'asdf',
          :crypted_password => 'asdf',
          :password_salt => 'asdf',
          :persistence_token => 'asdf',
          :single_access_token => 'asdf',
          :perishable_token => 'asdf',
          :login_count => 0,
          :failed_login_count => 0)
      end
    end

    def test_babysitter_has_parents
      assert_equal("Amanda", users(:amanda).first_name)
      assert_equal(1, users(:amanda).id)
      assert_equal(3, users(:amanda).friends.count)
    end

    def test_can_add_parent_to_babysitter
      amanda = users(:amanda)
      janet = users(:janet)
      assert_difference 'amanda.friends.count' do
        amanda.add_friend(janet)
      end
    end

    def test_can_add_reply
      amanda = users(:amanda)      
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
      amanda = users(:amanda)      
      assert_equal(2, amanda.replies.count)

      events = amanda.replies.collect{|r| r.event}
      assert_equal(2, events.count)
      assert_equal("Party", events[0].name)
      assert_equal("Wedding", events[1].name)
    end
  
  def test_parent_can_associate_with_babysitter
    janet = users(:janet)
    assert_equal(0, janet.friends.count)
    amanda = users(:amanda)
    janet.friends << amanda
    assert_equal(1, janet.friends.count)
  end
  
  def test_parent_can_create_event_and_assign_babysitter
    janet = users(:janet)
    amanda = users(:amanda)
    evt = Event.create(
      :name => 'ufc123',
      :eventDate => '11-19-2010',
      :startTime => '5:00:00',
      :endTime => '22:00:00',
      :user_id => janet.id,
      :note => 'asdf')
    
    assert_difference 'amanda.replies.count' do
      r = Reply.create(
        :answer => 'None',
        :note => 'asdf',
        :event_id => evt.id,
        :user_id => amanda.id)
    end
  end
  
  def test_search
    
  end
end
