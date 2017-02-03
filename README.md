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
#### There are two different uses for this gem.
##### Command Line File/Class Creator

Once you have the gem installed type `arbitrium -h` to see the different options.

Example Usage:
```
arbitrium -f place/where/I/want/file.rb -m run -a Fake,Name
# Results in the following file being created: [link.to.file]

arbitrium -f place/where/I/want/file.rb
# Results in the following file being created: [link.to.file]
```

When using the command line generator make sure that you are always using the path from your current position in the file structure.

##### Using Arbitrium::Result
In your method that they want to have the Result object call `Arbitrium::Result.new()` and pass in your arguments.  

Important things to note:
  1. You must pass at least two arguments
  2. The first argument must be a boolean type
  3. The second argument must be a string type
Any deviation from data types will result in an error being raised.

What a successful result may look like:
```
result = Arbitrium::Result.new(user.save, 'Some yucky error', user)

result.successful? # true
result.failed?     # false
result.message     # ''
result.object      # User object

# You can also call the class method default_success which takes an optional object
result = Arbitrium::Result.default_success(OptionalObject)

result.successful? # true
result.message     # 'Completed Succesfully.'
result.object      # OptionalObject
```

What a failed result may look like:
```
result = Arbitrium::Result.new(false, 'Failed to successfully do my job')

result.successful? # false
result.message     # Failed to successfully do my job
result.object      # nil

# You can also call the class method default_failure which takes an optional object
result = Arbitrium::Result.default_success

result.failed?  # true
result.message  # 'Failed to complete.'
result.object   # nil
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Lollar/arbitrium.
