require "test_helper"

class RequestMethodsTest < ActionDispatch::IntegrationTest
  prepend ::RailsKwargsTesting::RequestMethods

  def test_keyword_env
    post "/", env: { "rack.url_scheme" => "https" }
    assert_equal "https", decoded_body["scheme"]
  end

  def test_keyword_headers
    post "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_keyword_params
    post "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_delete
    delete "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_get
    get "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_head
    head "/", params: { a: 1 }
    assert_equal 200, response.status
  end

  def test_method_patch
    patch "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_post
    post "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_put
    put "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_get_via_redirect
    get_via_redirect "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_patch_via_redirect
    patch_via_redirect "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_post_via_redirect
    post_via_redirect "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_put_via_redirect
    put_via_redirect "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_request_via_redirect
    request_via_redirect :get, "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_xhr
    xhr :get, "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  def test_method_xml_http_request
    xml_http_request :get, "/", params: { a: 1 }
    assert_equal "1", decoded_body["params"]["a"]
  end

  private

  def app
    ::Rails.application
  end

  def decoded_body
    ::JSON.parse(response.body)
  end
end
