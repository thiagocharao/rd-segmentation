require 'test_helper'

class FilterConditionTest < ActiveSupport::TestCase

  test 'invalid with without comparator' do
    filter_condition = FilterCondition.new()
    refute filter_condition.valid?, filter_condition.errors.to_json
    assert_equal filter_condition.errors[:comparator][0], "can't be blank"
  end

  test 'invalid with invalid comparator' do
    filter_condition = FilterCondition.new(comparator: "+=")
    refute filter_condition.valid?, filter_condition.errors.to_json
    assert_equal filter_condition.errors[:comparator][0], "+= is not a valid comparator, possible values are '=', '%', '=*', '*=', '>', '<', '>=', '<='"
  end

  test 'invalid with without field' do
    filter_condition = FilterCondition.new()
    refute filter_condition.valid?, filter_condition.errors.to_json
    assert_equal filter_condition.errors[:field][0], "can't be blank"
  end

  test 'invalid with invalid field' do
    filter_condition = FilterCondition.new(field: "new_field")
    refute filter_condition.valid?, filter_condition.errors.to_json
    assert_equal filter_condition.errors[:field][0], "new_field is not a valid field, possible values are 'name', 'email', 'age', 'state', 'role'"
  end

end
