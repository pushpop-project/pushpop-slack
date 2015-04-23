require 'spec_helper'

describe Pushpop::Slack do
  it 'should do nothing because this is a template' do
    step = Pushpop::Slack.new do
    end
    result = step.run
    expect(result).to be_nil
  end
end
