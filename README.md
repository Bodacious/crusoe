# Crusoe

A simple daily work journal from your command-line 

```
# Open today's journal and add to it
$ crusoe
```

```
crusoe help
Commands:
  crusoe help [COMMAND]  # Describe available commands or one specific command
  crusoe journal         # This is the default task.
  crusoe read            # Read an entry
  crusoe report          # Generate a report for the last week
  crusoe toc             # Update the ToC on the README.md
```

## Installation

```
gem install crusoe
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bodacious/crusoe.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
