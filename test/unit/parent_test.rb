require 'test_helper'

class ParentTest < ActiveSupport::TestCase
  
  def test_should_have_working_associations
    assert_working_associations
  end

  def test_parent_can_associate_with_babysitter
    janet = parents(:janet)
    assert_equal(0, janet.babysitters.count)
    amanda = babysitters(:amanda)
    janet.babysitters << amanda
    assert_equal(1, janet.babysitters.count)
  end
  
  def test_parent_can_create_event_and_assign_babysitter
    janet = parents(:janet)
    amanda = babysitters(:amanda)
    evt = Event.create(
      :name => 'ufc123',
      :eventDate => '11-19-2010',
      :startTime => '5:00:00',
      :endTime => '22:00:00',
      :parent_id => janet.id,
      :note => 'asdf')
    
    assert_difference 'amanda.replies.count' do
      r = Reply.create(
        :answer => 'None',
        :note => 'asdf',
        :event_id => evt.id,
        :babysitter_id => amanda.id)
    end
  end
  
end
