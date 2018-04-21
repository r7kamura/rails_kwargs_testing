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

### Controller-specs

```ruby
RSpec.configuration.prepend RailsKwargsTesting::ControllerSpecHelper, type: :controller
```

```ruby
# `post :create, name: "My Widget"` in Rails 4
post :create, params: { name: "My Widget" }
```

### Request-specs

```ruby
RSpec.configuration.prepend RailsKwargsTesting::SpecSpecHelper, type: :request
```

```ruby
# `post "/widgets", name: "My Widget"` in Rails 4
post "/widgets", params: { name: "My Widget" }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/r7kamura/rails_kwargs_testing.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
