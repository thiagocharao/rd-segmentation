require 'test_helper'

class ContactSegmentationTest < ActiveSupport::TestCase
  setup do
  end

  test "should build the right where clause and find them" do
    clause = contact_segmentations(:one).build_where_clause_conditions
    assert_equal clause, [" name LIKE ? ", "Anna%"]
    assert_equal Contact.where(clause).length, 1

    clause = contact_segmentations(:two).build_where_clause_conditions
    assert_equal clause, [" name = ? ", "Donald Trump"]
    assert_equal Contact.where(clause).length, 1

    clause = contact_segmentations(:three).build_where_clause_conditions
    assert_equal clause, [" name LIKE ? AND age >= 18 ", "%Buscape"]
    assert_equal Contact.where(clause).length, 4

    clause = contact_segmentations(:four).build_where_clause_conditions
    assert_equal clause, [" name LIKE ? ", "%Buscape"]
    assert_equal Contact.where(clause).length, 6

  end
end
