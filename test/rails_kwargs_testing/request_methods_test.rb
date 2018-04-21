require "test_helper"

class RequestMethodsTest < ActionDispatch::IntegrationTest
  prepend ::RailsKwargsTesting::RequestMethods

  def test_env
    post "/articles", env: { "rack.url_scheme" => "https" }
    assert_equal "https", decoded_body["scheme"]
  end

  def test_headers
    post "/articles", params: { a: 1 }
    assert_equal "1", decoded_body["request_parameters"]["a"]
  end

  def test_params
    post "/articles", headers: { "Content-Type" => "application/json" }, params: { a: 1 }.to_json
    assert_equal 1, decoded_body["request_parameters"]["a"]
  end

  private

  def app
    ::Rails.application
  end

  def decoded_body
    ::JSON.parse(response.body)
  end
end
