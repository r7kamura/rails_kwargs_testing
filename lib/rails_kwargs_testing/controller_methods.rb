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
      define_method(method_name) do |action, flash: nil, format: nil, params: nil, session: nil, xhr: nil, as: nil|
        if as
          format ||= as
        end

        if format
          params = (params || {}).merge(format: format)
        end
        if xhr
          insert_xhr_headers
        end
        super(action, params, session, flash).tap do
          if xhr
            reset_xhr_headers
          end
        end
      end
    end

    %i[
      xhr
      xml_http_request
    ].each do |method_name|
      define_method(method_name) do |request_method, action, flash: nil, format: nil, params: nil, session: nil, as: nil|
        insert_xhr_headers
        __send__(request_method, action, flash: flash, format: format, params: params, session: session).tap do
          reset_xhr_headers
        end
      end
    end

    private

    def insert_xhr_headers
      @request.env['HTTP_X_REQUESTED_WITH'] = 'XMLHttpRequest'
      @request.env['HTTP_ACCEPT'] ||= [
        ::Mime::JS,
        ::Mime::HTML,
        ::Mime::XML,
        'text/xml',
        ::Mime::ALL,
      ].join(', ')
    end

    def reset_xhr_headers
      @request.env.delete 'HTTP_X_REQUESTED_WITH'
      @request.env.delete 'HTTP_ACCEPT'
    end
  end
end
