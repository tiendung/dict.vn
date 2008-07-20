require File.dirname(__FILE__) + '/../test_helper'
require 'suggest_controller'

# Re-raise errors caught by the controller.
class SuggestController; def rescue_action(e) raise e end; end

class SuggestControllerTest < Test::Unit::TestCase
  def setup
    @controller = SuggestController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
