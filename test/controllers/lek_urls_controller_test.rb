require 'test_helper'

class LekUrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lek_url = lek_urls(:one)
  end

  test "should get index" do
    get lek_urls_url
    assert_response :success
  end

  test "should get new" do
    get new_lek_url_url
    assert_response :success
  end

  test "should create lek_url" do
    assert_difference('LekUrl.count') do
      post lek_urls_url, params: { lek_url: { name: @lek_url.name, url: @lek_url.url } }
    end

    assert_redirected_to lek_url_url(LekUrl.last)
  end

  test "should show lek_url" do
    get lek_url_url(@lek_url)
    assert_response :success
  end

  test "should get edit" do
    get edit_lek_url_url(@lek_url)
    assert_response :success
  end

  test "should update lek_url" do
    patch lek_url_url(@lek_url), params: { lek_url: { name: @lek_url.name, url: @lek_url.url } }
    assert_redirected_to lek_url_url(@lek_url)
  end

  test "should destroy lek_url" do
    assert_difference('LekUrl.count', -1) do
      delete lek_url_url(@lek_url)
    end

    assert_redirected_to lek_urls_url
  end
end
