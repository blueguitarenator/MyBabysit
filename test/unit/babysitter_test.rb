require 'test_helper'

class BabysitterTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  def setup
    @amanda = Babysitter.find_by_email("amanda@msn.com")
  end
  
  test "test_babysitter_has parents" do
    assert_equal("Amanda", @amanda.firstName)
  end
end
