require 'test_helper'

class BabysitterTest < ActiveSupport::TestCase
  
  def test_should_have_working_associations
    assert_working_associations
  end
  
  def test_should_load_babysitter_attributes
    assert_equal 1, babysitters(:amanda).id
    assert_equal babysitters(:amanda), Babysitter.find(1)
    assert_equal 2, babysitters(:morgan).id
    assert_equal Babysitter.find(2), babysitters(:morgan)
  end
  
  def test_should_delete_one_babysitter
    assert_difference 'Babysitter.count', -1 do
      babysitters(:morgan).destroy
    end  
  end
  
  def test_should_create_one_babysitter
    assert_difference 'Babysitter.count' do
      Babysitter.create(
        :lastName => 'Smith', 
        :firstName => 'Mary', 
        :email => 'mary@msn.com', 
        :password => 'asdf', 
        :city => "Boston", 
        :stateAbbr => 'MA', 
        :zip => 23434)
    end
  end
  
  def test_babysitter_has_parents
    assert_equal("Amanda", babysitters(:amanda).firstName)
    assert_equal(1, babysitters(:amanda).id)
    assert_equal(2, babysitters(:amanda).get_parents("amanda@msn.com").count)
  end
  
  def test_can_add_parent_to_babysitter
    amanda = babysitters(:amanda)
    janet = parents(:janet)
    assert_difference 'amanda.parents.count' do
      amanda.add_parent(janet, amanda.email);
    end
  end
  
  
end
