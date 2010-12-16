require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  def test_should_have_working_associations
    assert_working_associations
  end
  
  def test_sitter_name
    evt = Factory(:dinner)
    assert_equal("Dinner", evt.name)
  end
  

end
