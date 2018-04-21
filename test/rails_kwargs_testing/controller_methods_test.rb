require "test_helper"

class ControllerMethodsTest < ActionController::TestCase
  prepend ::RailsKwargsTesting::ControllerMethods

  def setup
    super
    @controller = ::TestController.new
  end

  def test_keyword_flash
    post :index, flash: { a: 1 }
    assert_equal 1, decoded_body["flash"]["a"]
  end

  def test_keyword_format
    post :index, format: :json
    assert_equal "application/json", decoded_body["format"]
  end

  def test_keyword_params
    post :index, params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_keyword_session
    post :index, session: { a: 1 }
    assert_equal 1, decoded_body["session"]["a"]
  end

  def test_method_delete
    delete :index, params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_get
    get :index, params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_head
    head :index, params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_patch
    patch :index, params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_put
    put :index, params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_xhr
    xhr :post, :index, params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
    assert decoded_body["is_xhr"]
  end

  def test_method_xml_http_request
    xml_http_request :post, :index, params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
    assert decoded_body["is_xhr"]
  end

  private

  def decoded_body
    ::JSON.parse(response.body)
  end
end
