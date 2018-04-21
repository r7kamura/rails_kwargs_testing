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

### For ActionController::TestCase with Minitest

```ruby
class ArticlesControllerTest < ::ActionController::TestCase
  prepend ::RailsKwargsTesting::ControllerMethods

  def test_create
    post :create, params: { name: "Hello, World!" }
    assert_equal 200, response.status
  end
end
```

### For ActionController::TestCase with RSpec

```ruby
RSpec.describe ArticlesController do
  prepend RailsKwargsTesting::ControllerMethods

  describe "#create" do
    subject do
      # `post :create, name: "Hello, World!"` in Rails 4
      post :create, params: { name: "Hello, World!" }
    end

    it { is_expected.to eq 200 }
  end
end
```

### For ActionDispatch::IntegrationTest with Minitest

```ruby
class CreateArticleTest < ActionDispatch::IntegrationTest
  prepend ::RailsKwargsTesting::RequestMethods

  def test_create_article
    # `post "/articles", name: "Hello, World!"` in Rails 4
    post "/articles", params: { name: "Hello, World!" }
    assert_equal 200, response.status
  end
end
```

### For ActionDispatch::IntegrationTest with RSpec

```ruby
RSpec.describe "POST /articles" do
  prepend RailsKwargsTesting::RequestMethods

  subject do
    # `post "/articles", name: "Hello, World!"` in Rails 4
    post "/articles", params: { name: "Hello, World!" }
  end

  it { is_expected.to eq 200 }
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/r7kamura/rails_kwargs_testing.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
