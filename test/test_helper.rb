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
    post "/articles" => "articles#create"
  end
end

class ArticlesController < ActionController::Base
  include ::Rails.application.routes.url_helpers

  def create
    render(
      json: {
        flash: flash.to_hash,
        path_parameters: request.path_parameters,
        request_parameters: request.request_parameters,
        scheme: request.scheme,
        session: session.to_hash,
      }
    )
  end
end
