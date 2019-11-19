class Twitch::IRC::Message
  getter channel : String { params[0].lstrip('#') }
  getter content : String { params[1] }
  getter? mod : Bool { tags["mod"] == "1" }
  getter? owner : Bool { username == channel }
  getter username : String { prefix.source }

  private macro not_niller(name, type)
    private getter {{name}} : {{type}} { @message.{{name}}.not_nil! }
  end

  not_niller(tags, Hash(String, String?))
  not_niller(prefix, FastIRC::Prefix)
  not_niller(params, Array(String))

  def initialize(@message : FastIRC::Message)
  end
end
