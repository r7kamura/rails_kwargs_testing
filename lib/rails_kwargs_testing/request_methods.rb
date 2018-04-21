module RailsKwargsTesting
  module RequestMethods
    %i[
      delete
      get
      head
      patch
      post
      put
      get_via_redirect
      head_via_redirect
      patch_via_redirect
      post_via_redirect
      put_via_redirect
    ].each do |method_name|
      define_method(method_name) do |path, env: {}, headers: {}, params: nil|
        super(path, params, env.merge(headers))
      end
    end

    %i[
      request_via_redirect
      xhr
      xml_http_request
    ].each do |method_name|
      define_method(method_name) do |request_method, path, env: {}, headers: {}, params: nil|
        super(request_method, path, params, env.merge(headers))
      end
    end
  end
end
