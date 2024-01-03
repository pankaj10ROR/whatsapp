require 'test_helper'

class WhatsappsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @whatsapp = whatsapps(:one)
  end

  test "should get index" do
    get whatsapps_url
    assert_response :success
  end

  test "should get new" do
    get new_whatsapp_url
    assert_response :success
  end

  test "should create whatsapp" do
    assert_difference('Whatsapp.count') do
      post whatsapps_url, params: { whatsapp: { email: @whatsapp.email, name: @whatsapp.name, number: @whatsapp.number } }
    end

    assert_redirected_to whatsapp_url(Whatsapp.last)
  end

  test "should show whatsapp" do
    get whatsapp_url(@whatsapp)
    assert_response :success
  end

  test "should get edit" do
    get edit_whatsapp_url(@whatsapp)
    assert_response :success
  end

  test "should update whatsapp" do
    patch whatsapp_url(@whatsapp), params: { whatsapp: { email: @whatsapp.email, name: @whatsapp.name, number: @whatsapp.number } }
    assert_redirected_to whatsapp_url(@whatsapp)
  end

  test "should destroy whatsapp" do
    assert_difference('Whatsapp.count', -1) do
      delete whatsapp_url(@whatsapp)
    end

    assert_redirected_to whatsapps_url
  end
end
