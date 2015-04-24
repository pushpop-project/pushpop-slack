require 'pushpop'
require 'slack-notifier'

WEBHOOK_URL = ENV['SLACK_WEBHOOK_URL']

module Pushpop

  class Slack < Step

    PLUGIN_NAME = 'slack'

    Pushpop::Job.register_plugin(PLUGIN_NAME, self)

    attr_accessor :_channel
    attr_accessor :_username
    attr_accessor :_message

    def run(last_response=nil, step_responses=nil)

      configure(last_response, step_responses)

      unless _message
       raise 'Please set the message to send to Slack'
      end

      send_message
    
    end

    def send_message
      notifier = ::Slack::Notifier.new WEBHOOK_URL

      notifier.ping _message, options
    end

    def options
      opts = {}

      if _channel
        if _channel[0] == '#'
          opts['channel'] = _channel
        else
          opts['channel'] = "##{_channel}"
        end
      end

      if _username
        opts['username'] = _username
      end

      return opts
    end

    def channel(channel)
      self._channel = channel
    end

    def username(username)
      self._username = username
    end

    def message(message)
      self._message = message
    end

    def configure(last_response=nil, step_responses=nil)
      self.instance_exec(last_response, step_responses, &block)
    end

  end

end
