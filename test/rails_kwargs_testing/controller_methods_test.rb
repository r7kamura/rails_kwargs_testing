require "test_helper"

class ControllerMethodsTest < ActionController::TestCase
  prepend ::RailsKwargsTesting::ControllerMethods

  def setup
    super
    @controller = ::ArticlesController.new
  end

  def test_flash
    post :create, format: :json, flash: { a: 1 }
    assert_equal 1, decoded_body["flash"]["a"]
  end

  def test_format
    post :create, format: :json
    assert_equal "json", decoded_body["path_parameters"]["format"]
  end

  def test_params
    post :create, format: :json, params: { a: 1 }
    assert_equal 1, decoded_body["request_parameters"]["a"]
  end

  def test_session
    post :create, format: :json, session: { a: 1 }
    assert_equal 1, decoded_body["session"]["a"]
  end

  private

  def decoded_body
    ::JSON.parse(response.body)
  end
end
