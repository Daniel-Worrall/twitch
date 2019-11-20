require "./spec_helper"

describe "PING" do
  it "responds with PONG" do
    response = String.build do |io|
      connection = Twitch::IRC::Connection.new(io)
      client = Twitch::IRC::Client.new(connection, "foo", "bar")
      client.dispatch FastIRC::Message.new("PING", nil)
    end
    response.should eq FastIRC::Message.new("PONG", ["tmi.twitch.tv"]).to_s
  end
end

describe Twitch::IRC::Message do
  prefix = FastIRC::Prefix.new(source: "nekkalucifer", user: "nekkalucifer", host: "nekkalucifer.tmi.twitch.tv")

  describe "#channel" do
    it "returns without the #" do
      message = FastIRC::Message.new("PRIVMSG", ["#nekkalucifer", "testing message"])
      Twitch::IRC::Message.new(message).channel.should eq("nekkalucifer")
    end
  end

  describe "#mod?" do
    it "handles true" do
      tags = {"badges" => "moderator/1", "mod" => "1"} of String => String?
      message = FastIRC::Message.new("PRIVMSG", ["#notnekkalucifer", "testing message"], tags: tags)
      Twitch::IRC::Message.new(message).mod?.should eq(true)
    end

    it "handles false" do
      tags = {"badges" => "broadcaster/1,subscriber/0", "mod" => "0"} of String => String?
      message = FastIRC::Message.new("PRIVMSG", ["#nekkalucifer", "testing message"], tags: tags)
      Twitch::IRC::Message.new(message).mod?.should eq(false)
    end
  end

  describe "#owner?" do
    it "handles true" do
      message = FastIRC::Message.new("PRIVMSG", ["#nekkalucifer", "testing message"], prefix: prefix)
      Twitch::IRC::Message.new(message).owner?.should eq(true)
    end

    it "handles false" do
      message = FastIRC::Message.new("PRIVMSG", ["#notnekkalucifer", "testing message"], prefix: prefix)
      Twitch::IRC::Message.new(message).owner?.should eq(false)
    end
  end

  describe "#username" do
    it "parses" do
      message = FastIRC::Message.new("PRIVMSG", ["#nekkalucifer", "testing message"], prefix: prefix)
      Twitch::IRC::Message.new(message).username.should eq("nekkalucifer")
    end
  end
end
