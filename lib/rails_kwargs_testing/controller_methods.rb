module RailsKwargsTesting
  module ControllerMethods
    %i[
      delete
      get
      head
      patch
      post
      put
    ].each do |method_name|
      define_method(method_name) do |path, flash: nil, format: nil, params: nil, session: nil|
        if format
          params = (params || {}).merge(format: format)
        end
        super(path, params, session, flash)
      end
    end

    %i[
      xhr
      xml_http_request
    ].each do |method_name|
      define_method(method_name) do |request_method, action, flash: nil, format: nil, params: nil, session: nil|
        @request.env['HTTP_X_REQUESTED_WITH'] = 'XMLHttpRequest'
        @request.env['HTTP_ACCEPT'] ||=  [Mime::JS, Mime::HTML, Mime::XML, 'text/xml', Mime::ALL].join(', ')
        __send__(request_method, action, flash: flash, format: format, params: params, session: session).tap do
          @request.env.delete 'HTTP_X_REQUESTED_WITH'
          @request.env.delete 'HTTP_ACCEPT'
        end
      end
    end
  end
end
