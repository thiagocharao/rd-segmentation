require 'test_helper'

class ContactSegmentationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_segmentation = contact_segmentations(:one)
    @filter_conditions = [filter_conditions(:one)]
  end

  test "should get index" do
    get contact_segmentations_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_segmentation_url
    assert_response :success
  end

  test "should create contact_segmentation" do
    assert_difference('ContactSegmentation.count') do
      post contact_segmentations_url, params: { contact_segmentation: { description: "new one", filter_conditions_attributes: @filter_conditions } }
    end

    assert_redirected_to contact_segmentations_path
  end

  test "should show contact_segmentation" do
    get contact_segmentation_url(@contact_segmentation)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_segmentation_url(@contact_segmentation)
    assert_response :success
  end

  test "should update contact_segmentation" do
    patch contact_segmentation_url(@contact_segmentation), params: { contact_segmentation: { description: @contact_segmentation.description } }
    assert_redirected_to contact_segmentation_url(@contact_segmentation)
  end

  test "should destroy contact_segmentation" do
    assert_difference('ContactSegmentation.count', -1) do
      delete contact_segmentation_url(@contact_segmentation)
    end

    assert_redirected_to contact_segmentations_url
  end
end
