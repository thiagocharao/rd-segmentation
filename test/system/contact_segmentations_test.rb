require "application_system_test_case"

class ContactSegmentationsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit contact_segmentations_url

    assert_selector "h1", text: "ContactSegmentation"
  end
end
