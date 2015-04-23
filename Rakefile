$stdout.sync = true

$: << File.join(File.dirname(__FILE__), './lib')

begin
  require 'rspec/core/rake_task'
  desc 'Run Rspec unit tests'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/**/*_spec.rb'
  end

  task default: :spec
rescue LoadError
end


