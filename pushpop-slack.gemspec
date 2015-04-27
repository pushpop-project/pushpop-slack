# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'pushpop-slack/version'

Gem::Specification.new do |s|

  s.name        = "pushpop-slack"
  s.version     = Pushpop::Slack::VERSION
  s.authors     = ["Joe Wegner"]
  s.email       = "joe@keen.io"
  s.homepage    = "https://github.com/pushpop-project/pushpop-slack"
  s.summary     = "Send messages to Slack via Pushpop!"
  s.description = "pushpop-slack allows you to send messages to your slack channel inside of a Pushpop job"

  s.add_dependency "pushpop"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

