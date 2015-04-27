## pushpop-plugin

A [Pushpop](https://github.com/pushpop-project/pushpop) plugin for sending messages to Slack

### Installation

Add `pushpop-slack` gem to your Gemfile

```ruby
gem 'pushpop-slack'
```

or install it as a gem

```bash
$ gem install pushpop-slack
```

You will also need to set an environment variable for your Slack Webhook. Here's how:

1. Go to your Slack team site and [create an Incoming Webhooks integration](slack.com/services/new).
2. Choose a default channel for pushpop messages. You can override this in the actual job.
3. Copy the `Webhook URL`.
4. Set that to `SLACK_WEBHOOK_URL` in your environment ([heroku](https://devcenter.heroku.com/articles/config-vars), [shell](https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-a-linux-vps))

### Usage

`pushpop-slack` has a pretty easy DSL for sending messages to slack, and also handles all of the weird formatting that Slack requires. It copies much of the functionality of the [slack-notifier](https://github.com/stevenosloan/slack-notifier) gem, which is used internally.

Here's a very basic example of sending a message to slack:

```ruby
job 'send "Hello, World!" to #general'

	slack do
		message 'Hello, World!'
	end

end
```

#### Links

We use slack-notifier's [`LinkFormatter`](https://github.com/stevenosloan/slack-notifier#links) internally. That means you can either use HTML or Markdown format for your links

```ruby
job 'send "Hello, World!" to #general'

	slack do
		message 'Where [in the world](http://en.wikipedia.org/wiki/Carmen_Sandiego) is Carmen Sandiego?'
		# or
		message 'Have you seen this <a href="http://en.wikipedia.org/wiki/Carmen_Sandiego">in the world</a> is Carmen Sandiego?'
	end

end
```

#### Setting the channel

Your webhook has a default channel that it sends to, but you can also choose a custom channel at runtime


```ruby
job 'send "Hello, World!" to #general'

	slack do
		message 'Hello, World!'
		channel '#alerts'
	end

end
```

Slack expects the `#` before your channel name. However, if you forget it, pushpop-slack will insert it there for your convenience

#### Username

You can choose a custom username for your message to "come from". This can be a completely new username, or an existing one.

```ruby
job 'send "Hello, World!" to #general'

	slack do
		message 'Hello, World!'
		username 'Carmen Sandiego'
	end

end
```

#### Icon

You can also set the avatar/icon for the "user" sending the message. Paired with the [Username](#username), this can make your pushpop messages look like they're from a real user.

You can use emoji icons, or just use an image anywhere on the internet. For emoji, use the slack formatting (ie: `:ghost:`). For an image on the internet, just enter a URL (must start with `http`).

```ruby
job 'send "Hello, World!" to #general'

	slack do
		message 'Hello, World!'
		icon ':ghost:'
		# or
		icon 'https://upload.wikimedia.org/wikipedia/en/e/ed/Carmen_Sandiego.png'
	end

end
```

#### Unfurl

By default, Slack does not [unfurl](https://api.slack.com/docs/unfurling) links from Webhooks (only media, like images). You can override that default by calling unfurl.

Calling `unfurl` with no parameter will default to true, or you can pass it a boolean.

```ruby
job 'send "Hello, World!" to #general'

	slack do
		message 'Where [in the world](http://en.wikipedia.org/wiki/Carmen_Sandiego) is Carmen Sandiego?'
		unfurl
		# or
		unfurl true
	end

end
```

#### Attachments

You can send attachments over Slack as well. Attachments have a lot of options, so you have to pass in a pretty heavy configuration block. If you're going to use attachments, it's worth reading the slack-notifier [paramters docs](https://github.com/stevenosloan/slack-notifier#additional-parameters) and the Slack [Attachments Reference](https://api.slack.com/docs/attachments).

```
job do

  slack do

    first_attachment = {
      fallback: 'This is the fallback',
      pretext: 'Hey check out this attachment',
      color: '#b0b0b0',
      fields: [
        {
          title: 'Field Title',
          value: 'This is the value of the first field!',
          short: false
        }
      ]
    }

    message 'Hello, World!'
    attachment first_attachment
  end
end
```

### Contributing

Code and documentation issues and pull requests are welcome.