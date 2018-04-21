$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "action_controller/railtie"
require "active_support"
require "minitest/autorun"
require "rails_kwargs_testing"
require "rails/test_help"

ActiveSupport.test_order = :random

class TestApp < Rails::Application
  secrets.secret_key_base = "secret_key_base"

  ::Rails.logger = ::Logger.new(nil)

  routes.draw do
    delete "/" => "test#index"
    get "/" => "test#index"
    patch "/" => "test#index"
    post "/" => "test#index"
    put "/" => "test#index"
  end
end

class TestController < ActionController::Base
  include ::Rails.application.routes.url_helpers

  def index
    render(
      json: {
        flash: flash.to_hash,
        format: request.format.to_s,
        is_xhr: request.xhr?,
        params: params.to_hash,
        scheme: request.scheme,
        session: session.to_hash,
      }
    )
  end
end
