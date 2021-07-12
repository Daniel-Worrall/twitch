record Twitch::Stream,
  id : {type: Int64, converter: ID64Converter},
  user_id : {type: Int32, converter: IDConverter},
  user_name : String,
  game_id : {type: Int32, converter: IDConverter},
  tag_ids : Array(String)?,
  type : String, # TODO: Enum
  title : String,
  viewer_count : Int32,
  started_at : String, # TODO: Time
  language : String,
  thumbnail_url : String do
  include JSON::Serializable
end
