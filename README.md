# Arbitrium

Arbitrium is a gem that gives a clear definition to service level classes and provides an object that will return the result. It is a plain-old-ruby gem that has no dependencies on Rails or any other framework.  Please stay tuned, there are more features to come!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arbitrium'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arbitrium

## Usage

To use this gem simply call Arbitrium::Result.new and pass in a boolean whether the build failed or not, a corresponding message, and then the optional object.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Lollar/arbitrium.
