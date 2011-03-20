require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @rich = Factory(:rich)
    @amanda = Factory(:amanda)
    @morgan = Factory(:morgan)
    @dinner = Factory(:dinner)
    @yes = Factory(:yes_reply)
    @no = Factory(:no_reply)
    @dinner.user_id = @rich.id
    @yes.event_id = @dinner.id
    @yes.user_id = @amanda.id
    @no.event_id = @dinner.id
    @no.user_id = @morgan.id
    @dinner.replies << @yes
    @dinner.replies << @no
  end
  
  def test_should_have_working_associations
    assert_working_associations
  end
  
  def test_sitter_name
    assert_equal "Dinner", @dinner.name
    assert_equal "Amanda Barker", @dinner.sitter_name('yes')
  end
  

end
