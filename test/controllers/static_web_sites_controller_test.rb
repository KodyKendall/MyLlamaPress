require "test_helper"

class StaticWebSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @static_web_site = static_web_sites(:one)
  end

  test "should get index" do
    get static_web_sites_url
    assert_response :success
  end

  test "should get new" do
    get new_static_web_site_url
    assert_response :success
  end

  test "should create static_web_site" do
    assert_difference("StaticWebSite.count") do
      post static_web_sites_url, params: { static_web_site: { name: @static_web_site.name, organization_id: @static_web_site.organization_id, slug: @static_web_site.slug } }
    end

    assert_redirected_to static_web_site_url(StaticWebSite.last)
  end

  test "should show static_web_site" do
    get static_web_site_url(@static_web_site)
    assert_response :success
  end

  test "should get edit" do
    get edit_static_web_site_url(@static_web_site)
    assert_response :success
  end

  test "should update static_web_site" do
    patch static_web_site_url(@static_web_site), params: { static_web_site: { name: @static_web_site.name, organization_id: @static_web_site.organization_id, slug: @static_web_site.slug } }
    assert_redirected_to static_web_site_url(@static_web_site)
  end

  test "should destroy static_web_site" do
    assert_difference("StaticWebSite.count", -1) do
      delete static_web_site_url(@static_web_site)
    end

    assert_redirected_to static_web_sites_url
  end
end