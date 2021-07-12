module Twitch
  record Event(T),
    id : String,
    event_type : String,      # TODO: Enum
    event_timestamp : String, # TODO: Time
    version : String,
    event_data : T do
    include JSON::Serializable
  end

  record ModeratorEvent,
    broadcaster_id : {type: Int32, converter: IDConverter},
    broadcaster_name : String,
    user_id : {type: Int32, converter: IDConverter},
    user_name : String do
    include JSON::Serializable
  end

  record BanEvent,
    broadcaster_id : {type: Int32, converter: IDConverter},
    broadcaster_name : String,
    user_id : {type: Int32, converter: IDConverter},
    user_name : String,
    expires_at : String do # TODO: Time
    include JSON::Serializable
  end

  record SubscriptionEvent,
    broadcaster_id : {type: Int32, converter: IDConverter},
    broadcaster_name : String,
    is_gift : Bool,
    plan_name : String,
    tier : String, # TODO: TierConverter?
    user_id : {type: Int32, converter: IDConverter},
    user_name : String,
    message : String do
    include JSON::Serializable
  end
end
