module Twitch
  # :nodoc:
  record Page(T),
    total : Int32?,
    data : Array(T),
    pagination : Pagination do
    include JSON::Serializable

    delegate cursor, to: pagination
  end

  # :nodoc:
  record Pagination,
    cursor : String? do
    include JSON::Serializable
  end
end
