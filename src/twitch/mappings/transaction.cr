module Twitch
  record Transaction,
    id : String,
    timestamp : String, # TODO: Time
    broadcaster_id : {type: Int32, converter: IDConverter},
    broadcaster_name : String,
    user_id : {type: Int32, converter: IDConverter},
    user_name : String,
    product_type : String, # TODO: Enum
    product_data : Product do
    include JSON::Serializable
  end

  record Product,
    domain : String,
    broadcast : Bool,
    expiration : String,
    sku : String,
    cost : Cost,
    displayName : String,
    inDevelopment : Bool do
    include JSON::Serializable
  end

  record Cost,
    amount : Int32,
    type : String do # TODO: Enum
    include JSON::Serializable
  end
end
