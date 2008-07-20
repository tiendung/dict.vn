require File.dirname(__FILE__) + '/../test_helper'

class ItemTest < Test::Unit::TestCase
  fixtures :items

  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_invalid_with_empty_attributes
    item = Item.new
    assert !item.valid?
    assert item.errors.invalid?(:written_form)
    assert item.errors.invalid?(:language)
  end

end
