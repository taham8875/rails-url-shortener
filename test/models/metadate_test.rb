require "test_helper"

class MetadataTest < ActiveSupport::TestCase
  test "title attribute" do
    assert_equal "Google", Metadata.new("<title>Google</title>").title
  end

  test "missing title attribute" do
    assert_nil Metadata.new.title
  end

  test "meta description attribute" do
    assert_equal "Google Search", Metadata.new("<meta name='description' content='Google Search'>").description
  end

  test "missing meta description attribute" do
    assert_nil Metadata.new.description
  end

  test "og:image attribute" do
    assert_equal "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png", Metadata.new("<meta property='og:image' content='https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png'>").image
  end

  test "missing og:image attribute" do
    assert_nil Metadata.new.image
  end
end
