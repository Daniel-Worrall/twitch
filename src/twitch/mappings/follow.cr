record Twitch::Follow,
  from_id : {type: Int32, converter: IDConverter},
  from_name : String,
  to_id : {type: Int32, converter: IDConverter},
  to_name : String,
  followed_at : String do # TODO: Time
  include JSON::Serializable
end
