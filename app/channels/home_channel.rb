class HomeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "home_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast('home_channel', data)
  end

  def recieve(data)
    ActionCable.server.broadcast('home_channel', data)
  end
end