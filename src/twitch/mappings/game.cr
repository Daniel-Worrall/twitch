record Twitch::Game,
  id : {type: Int32, converter: IDConverter},
  name : String,
  box_art_url : String do
  include JSON::Serializable
end
