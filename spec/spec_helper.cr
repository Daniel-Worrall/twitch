require "spec"
require "../src/twitch"

# Monkeypatching to allow calling private methods
module Twitch
  module IRC
    class Client
      def dispatch(m : FastIRC::Message)
        previous_def(m)
      end
    end
  end
end
