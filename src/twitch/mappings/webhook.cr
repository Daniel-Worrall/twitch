require "onyx-eda/event"

record Twitch::WebhookEvent(T),
  data : Array(T),
  options : Hash(String, String) = {} of String => String do
  include JSON::Serializable
  include Onyx::EDA::Event

  def initialize(event : WebhookEvent)
    @data = event.data.map(&.as(T))
    @options = event.options
  end

  macro method_missing(call)
    if options.has_key?("{{call}}")
      options["{{call}}"]
    else
      nil
    end
  end
end
