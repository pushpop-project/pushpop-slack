require 'spec_helper'

describe Pushpop::Slack do
  it 'should make sure there is a message' do
    step = Pushpop::Slack.new do
      message 'test'
    end 

    expect{step.run}.to raise_error
  end

  it 'should prepend a # to the channel if its not there' do
    step = Pushpop::Slack.new do
      channel 'test'
    end

    step.options['channel'].should eq('#test')
  end

  it 'should not prepend a # to the channel if its already there' do
    step = Pushpop::Slack.new do
      channel '#test'
    end

    step.options['channel'].should eq('#test')
  end
end
