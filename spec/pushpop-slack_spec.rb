require 'spec_helper'

describe Pushpop::Slack do
  it 'should make sure there is a message' do
    step = Pushpop::Slack.new do
    end 

    expect{step.run}.to raise_error
  end

  it 'should prepend a # to the channel if its not there' do
    step = Pushpop::Slack.new do
      message 'nothing'
      channel 'test'
    end

    step.configure

    expect(step.options['channel']).to eq('#test')
  end

  it 'should not prepend a # to the channel if its already there' do
    step = Pushpop::Slack.new do
      message 'nothing'
      channel '#test'
    end

    step.configure

    expect(step.options['channel']).to eq('#test')
  end

  it 'should set URL icons' do
      step = Pushpop::Slack.new do
        message 'nothing'
        icon 'https://keen.io/file.png'
      end

      step.configure

      expect(step.options["icon_url"]).to eq("https://keen.io/file.png")
  end

  it 'should set emoji icons' do
    step = Pushpop::Slack.new do
      message 'nothing'
      icon ':ghost:'
    end

    step.configure

    expect(step.options['icon_emoji']).to eq(':ghost:')
  end

  it 'should set add colons to emoji icons' do
    step = Pushpop::Slack.new do
      message 'nothing'
      icon 'ghost'
    end

    step.configure

    expect(step.options['icon_emoji']).to eq(':ghost:')
  end

  it 'should format links in the message' do
    step = Pushpop::Slack.new do
      message 'Check out [this link](https://keen.io) to Keen!'
    end

    step.configure

    expect(step._message).to include('<https://keen.io|this link>')
  end
end
