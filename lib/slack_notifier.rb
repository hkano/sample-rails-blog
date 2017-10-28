# frozen_string_literal: true

module SlackNotifier

  CHANNEL = "#sample-rails-blog"

  class << self

    def notify(text, channel: CHANNEL)
      begin
        client.chat_postMessage(channel: channel, text: text)
      rescue
      end
    end

    private

    def client
      @client ||= Slack::Web::Client.new
    end

  end

end
