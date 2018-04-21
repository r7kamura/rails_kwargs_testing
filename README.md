# RailsKwargsTesting

Provides Rails 5 compatible testing methods for gradual migration from Rails 4 to 5.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rails_kwargs_testing"
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```ruby
gem install rails_kwargs_testing
```

## Usage

For example with RSpec:

```ruby
# spec/rails_helper.rb
RSpec.configure do |config|
  config.prepend RailsKwargsTesting::ControllerSpecHelper, type: :controller
  config.prepend RailsKwargsTesting::RequestSpecHelper, type: :request
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/r7kamura/rails_kwargs_testing.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
