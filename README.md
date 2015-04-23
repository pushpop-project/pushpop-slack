## pushpop-plugin

A template for creating [Pushpop](https://github.com/keenlabs/pushpop) plugins that can
be published as gems and easily included in Pushpop projects.

See [pushpop-github](https://github.com/pushpop-project/pushpop-github) for an example
of a plugin/gem.

### Usage

Clone this repository, and rename it to pushpop-<plugin>, where plugin is the name of
what you're building. Update files and references to reflect your plugin name, and add your code.

For others to easily use your plugin, you'll want to create a Ruby gem. Once you have a Rubygems
account and are authorized, you can publish the gem:

``` shell
$ gem build pushpop-<plugin>.gemspec
$ gem push pushpop-<plugin>-0.1.0.gem
```

Users will then be able to use your plugin by including it in their Gemfile:

``` ruby
gem 'pushpop'
gem 'pushpop-<plugin>'
```

### Contributing

Code and documentation issues and pull requests are welcome. Help us make this template as
useful as possible!
