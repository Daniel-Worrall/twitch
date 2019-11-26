struct Twitch::IRC::Message
  getter channel_id : Int32 { tags["room-id"].not_nil!.to_i }
  getter channel : String { params[0] }
  getter content : String { params[1] }
  getter? mod : Bool { tags["mod"] == "1" }
  getter? owner : Bool { user_id == channel_id }
  getter user_id : Int32 { tags["user-id"].not_nil!.to_i }
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
